package sciuto.corey.lcwdb;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableAutoConfiguration
@EnableWebMvc
@ComponentScan
public class MainConfiguration {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        System.out.println("Hello.");
    }

}
