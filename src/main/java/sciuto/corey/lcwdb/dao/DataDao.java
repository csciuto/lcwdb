package sciuto.corey.lcwdb.dao;

import java.util.List;

import sciuto.corey.lcwdb.model.Cemetery;
import sciuto.corey.lcwdb.model.QueryByName;
import sciuto.corey.lcwdb.model.QueryByNameResultRecord;
import sciuto.corey.lcwdb.model.SoldierResultRecord;

public interface DataDao {

	public List<QueryByNameResultRecord> queryByName(QueryByName query);
	public SoldierResultRecord querySoldier(Integer id);
	public List<Cemetery> getCemeteries();
	
}
