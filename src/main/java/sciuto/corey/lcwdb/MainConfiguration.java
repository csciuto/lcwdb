package sciuto.corey.lcwdb;

import org.apache.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@EnableAutoConfiguration
@ComponentScan
public class MainConfiguration extends SpringBootServletInitializer {

	private static final Logger LOGGER = Logger.getLogger(DatabaseDevConfiguration.class);
	
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        
        return application.sources(MainConfiguration.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(MainConfiguration.class, args);
    }

}
