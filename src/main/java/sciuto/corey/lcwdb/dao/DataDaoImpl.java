package sciuto.corey.lcwdb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Component;

import sciuto.corey.lcwdb.model.*;
import sciuto.corey.lcwdb.model.SortBy.SortType;

@Component
public class DataDaoImpl implements DataDao {

	private static final Logger LOGGER = Logger.getLogger(DataDaoImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final static String QUERY_BY_NAME = "SELECT s.first_name,s.last_name,s.middle_initial,s.suffix,s.fivehundred_club,"
			+"c.cemetery_name,s.soldier_id,s.date_of_death\n"
			+"FROM soldier s, cemetery c\n"
			+"WHERE s.cemetery_id=c.cemetery_id";
	private ParameterizedRowMapper<QueryByNameResultRecord> byNameRowMapper = new ParameterizedRowMapper<QueryByNameResultRecord>() {
		@Override
		public QueryByNameResultRecord mapRow(ResultSet rs, int rowNum) throws SQLException {
			QueryByNameResultRecord s = new QueryByNameResultRecord();
			s.setFirstName(rs.getString(1));
			s.setLastName(rs.getString(2));
			s.setMiddleInitial(rs.getString(3));
			s.setSuffix(rs.getString(4));
			s.setKilledInAction(rs.getBoolean(5));
			s.setCemeteryName(rs.getString(6));
			s.setId(rs.getInt(7));
			s.setDateOfDeath(rs.getDate(8));
			return s;
		}
	};

	private final static String QUERY_BY_SOLDIER = "SELECT s.first_name,s.last_name,s.middle_initial,s.suffix,s.fivehundred_club,"
			+"c.cemetery_name,s.soldier_id,s.cemetery_lot,s.cemetery_book_page,"
			+"s.date_of_death,r.rank_name,n.note,p.city_name,p.state_code,m.monument_type_name\n"
			+"FROM soldier s\n"
			+"LEFT JOIN soldier_rank r ON (s.rank_id=r.rank_id )\n"
			+"LEFT JOIN notes n ON (s.note_id=n.note_id)\n"
			+"LEFT JOIN place p ON (s.place_of_residence_id=p.place_id)\n"
			+"LEFT JOIN monument_type m ON (s.monument_type_id=m.monument_type_id)\n"
			+"JOIN cemetery c ON (c.cemetery_id = s.cemetery_id)\n";
	private ParameterizedRowMapper<SoldierResultRecord> bySoldierRowMapper = new ParameterizedRowMapper<SoldierResultRecord>() {
		@Override
		public SoldierResultRecord mapRow(ResultSet rs, int rowNum) throws SQLException {
			SoldierResultRecord s = new SoldierResultRecord();
			s.setFirstName(rs.getString(1));
			s.setLastName(rs.getString(2));
			s.setMiddleInitial(rs.getString(3));
			s.setSuffix(rs.getString(4));
			s.setKilledInAction(rs.getBoolean(5));
			s.setCemeteryName(rs.getString(6));
			s.setId(rs.getInt(7));
			s.setCemeteryLot(rs.getString(8));
			s.setCemeteryBookPage(rs.getInt(9));
			s.setDateOfDeath(rs.getDate(10));
			s.setRank( rs.getString(11) == null ? "" : rs.getString(11) );
			s.setNotes(rs.getString(12));
			s.setResidenceCity(rs.getString(13));
			s.setResidenceState(rs.getString(14));
			s.setMonumentType(rs.getString(15));
			return s;
		}
	};
	
	private final static String QUERY_BY_SOLDIER_FOR_UNITS = "select r.regiment_name, c.company_name\n"
			+"from company c,company_assignment ca, regiment r\n"
			+"where c.company_id = ca.company_id and c.regiment_id = r.regiment_id and ca.soldier_id=?";
	private ParameterizedRowMapper<Unit> unitBySoldierRowMapper = new ParameterizedRowMapper<Unit>() {
		@Override
		public Unit mapRow(ResultSet rs, int rowNum) throws SQLException {
			Unit u = new Unit();
			u.setRegiment(rs.getString(1));
			u.setCompany(rs.getString(2));
			return u;
		}
	};
	
	private final static String QUERY_BY_SOLDIER_FOR_SHIPS = "select s.ship_name\n"
			+"from ship s, ship_assignment sa\n"
			+"where s.ship_id = sa.ship_id and sa.soldier_id=?";
	private ParameterizedRowMapper<Ship> shipBySoldierRowMapper = new ParameterizedRowMapper<Ship>() {
		@Override
		public Ship mapRow(ResultSet rs, int rowNum) throws SQLException {
			Ship s = new Ship();
			s.setShip(rs.getString(1));
			return s;
		}
	};

	private final static String QUERY_FOR_CEMETERIES = "select cemetery_id, cemetery_name\n"
			+"from cemetery\n";
	private ParameterizedRowMapper<Cemetery> cemeteryRowMapper = new ParameterizedRowMapper<Cemetery>() {
		@Override
		public Cemetery mapRow(ResultSet rs, int rowNum) throws SQLException {
			Cemetery c = new Cemetery();
			c.setId(rs.getInt(1));
			c.setName(rs.getString(2));
			return c;
		}
	};
	
	@Override
	public List<QueryByNameResultRecord> queryByName(QueryByName query) {
		
		List<String> whereClause = new ArrayList<String>();
		List<Object> arguments = new ArrayList<Object>();
		
		if (StringUtils.isNotBlank(query.getFirstName())){
			whereClause.add("upper(s.first_name) like upper(?)");
			arguments.add(query.getFirstName());
		}
		if (StringUtils.isNotBlank(query.getLastName())){
			whereClause.add("upper(s.last_name) like upper(?)");
			arguments.add(query.getLastName());
		}
		if (query.getFiveHundredClub() != null && query.getFiveHundredClub() == true){
			whereClause.add("s.fivehundred_club = true");
		}
		if (query.getCemeteryId() != null){
			whereClause.add("c.cemetery_id = ?");
			arguments.add(query.getCemeteryId());
		}
		if (StringUtils.isNotBlank(query.getStartDeathDate())){
			whereClause.add("s.date_of_death >= date(?)");
			arguments.add(query.getStartDeathDate());
		}
		if (StringUtils.isNotBlank(query.getEndDeathDate())){
			whereClause.add("s.date_of_death <= date(?)");
			arguments.add(query.getEndDeathDate());
		}
		
		StringBuilder queryBuilder = new StringBuilder(QUERY_BY_NAME);
		if (whereClause.size() > 0) {
			for (int i=0;i<whereClause.size();i++){
				queryBuilder.append(" AND ").append(whereClause.get(i));
			}
		}
		
		SortType sortBy = SortBy.convertFromInternal(query.getSortBy());
		String orderBy;
		if (sortBy == SortType.DOD_ASC){
			orderBy = " ORDER BY s.date_of_death asc";
		} else if (sortBy == SortType.DOD_DESC){
			orderBy = " ORDER BY s.date_of_death desc";
		} else if (sortBy == SortType.NAME_DESC){
			orderBy = " ORDER BY s.last_name desc, s.first_name desc";
		} else {
			orderBy = " ORDER BY s.last_name asc, s.first_name asc";
		}
		queryBuilder.append(orderBy);
		
		String queryToRun = queryBuilder.toString();
		if (LOGGER.isDebugEnabled()){
			LOGGER.debug("Running query " + queryToRun + " Params " + arguments);
		}
		
		return jdbcTemplate.query(queryToRun, arguments.toArray(), byNameRowMapper);
	}

	/**
	 * Throws an {@link IllegalArgumentException if the soldier identified by id doesn't exist.}
	 */
	@Override
	public SoldierResultRecord querySoldier(Integer id) {
		String whereClause = " AND s.soldier_id=?";
		List<Object> arguments = new ArrayList<Object>();
		
		String query = QUERY_BY_SOLDIER + whereClause;
		arguments.add(id);
		
		if (LOGGER.isDebugEnabled()){
			LOGGER.debug("Running query " + query + " Params " + arguments);
		}
		SoldierResultRecord result;
		
		try{
			result = jdbcTemplate.queryForObject(query, arguments.toArray(), bySoldierRowMapper);
		} catch (IncorrectResultSizeDataAccessException e) {
			LOGGER.warn("Failure querying for soldier id " + id);
			throw new IllegalArgumentException(e);
		}
		
		if (LOGGER.isDebugEnabled()){
			LOGGER.debug("Running query " + QUERY_BY_SOLDIER_FOR_UNITS + " Params " + arguments);
		}
		List<Unit> units =  jdbcTemplate.query(QUERY_BY_SOLDIER_FOR_UNITS, arguments.toArray(), unitBySoldierRowMapper);
		
		if (LOGGER.isDebugEnabled()){
			LOGGER.debug("Running query " + QUERY_BY_SOLDIER_FOR_SHIPS + " Params " + arguments);
		}
		List<Ship> ships = jdbcTemplate.query(QUERY_BY_SOLDIER_FOR_SHIPS, arguments.toArray(), shipBySoldierRowMapper);
		
		result.setUnits(units);
		result.setShips(ships);
		
		return result;
	}

	@Override
	public List<Cemetery> getCemeteries() {
		
		if (LOGGER.isDebugEnabled()){
			LOGGER.debug("Running query " + QUERY_FOR_CEMETERIES);
		}
		
		return jdbcTemplate.query(QUERY_FOR_CEMETERIES, cemeteryRowMapper);
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
}
