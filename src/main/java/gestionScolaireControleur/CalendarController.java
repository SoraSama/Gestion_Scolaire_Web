package gestionScolaireControleur;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller  
@RequestMapping("/calendar")  
public class CalendarController {
	
	@RequestMapping(method = RequestMethod.GET)
	   public String printHello(ModelMap model) {
	      model.addAttribute("message", "Hello ");
	      return "calendar";
	   }

	
	@RequestMapping(value = "/json", method = RequestMethod.GET)
	@ResponseBody
	   public String getJsonCal(ModelMap model) {
		System.out.println("-------------------------------------------------------------------");
	    return "OK";
	   }

}
