package sciuto.corey.lcwdb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SanityCheck {

    @RequestMapping("/test")
    ModelAndView home() {
        return new ModelAndView("This is the Example class");
    }
}
