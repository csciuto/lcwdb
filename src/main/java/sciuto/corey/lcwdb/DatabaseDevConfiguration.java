package sciuto.corey.lcwdb;

import java.net.URI;
import java.net.URISyntaxException;

import org.apache.log4j.Logger;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.JdbcTemplate;

@Profile("dev")
@Configuration
public class DatabaseDevConfiguration {

	private static final Logger LOGGER = Logger.getLogger(DatabaseDevConfiguration.class);
	
	@Autowired
	DataSource dataSource;
	
	/**
	 * Not sure how else to do this. Spring Boot wants a properties file,
	 * but Heroku requires you check an environment variable
	 * (this code is from the Heroku example)
	 * 
	 * @return
	 * @throws URISyntaxException
	 */
	@Bean
	public DataSource dataSource() throws URISyntaxException {
		
		LOGGER.info("Configuring TEST database");
		
        URI dbUri = new URI(System.getenv("DATABASE_URL"));

        String username = dbUri.getUserInfo().split(":")[0];
        String password = dbUri.getUserInfo().split(":")[1];
        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath() + "?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";

        DataSource basicDataSource = new DataSource();
        basicDataSource.setUrl(dbUrl);
        basicDataSource.setUsername(username);
        basicDataSource.setPassword(password);
        
        basicDataSource.setDriverClassName("org.postgresql.Driver");
        
        return basicDataSource;
	}
	
    @Bean
    public JdbcTemplate jdbcTemplate() {

    	return new JdbcTemplate(dataSource);
    }
}
