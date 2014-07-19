package sciuto.corey.lcwdb;

import java.net.URI;
import java.net.URISyntaxException;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

@Configuration
public class DatabaseConfiguration {

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
        URI dbUri = new URI(System.getenv("DATABASE_URL"));

        String username = dbUri.getUserInfo().split(":")[0];
        String password = dbUri.getUserInfo().split(":")[1];
        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

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
