package sciuto.corey.lcwdb;

import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

@Configuration
public class ServletConfiguration {
	@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {
		return new MyCustomizer();
	}

	private static class MyCustomizer implements EmbeddedServletContainerCustomizer {

		/**
		 * Spring Boot by default sends 404s to the regular error handler...
		 */
		@Override
		public void customize(ConfigurableEmbeddedServletContainer factory) {
			factory.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404"));
			factory.setContextPath("/lcwdb");
		}

	}
}
