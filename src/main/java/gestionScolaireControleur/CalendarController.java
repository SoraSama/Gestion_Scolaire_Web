package gestionScolaireControleur;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import gestionScolaire.metier.dao.EtablissementDao;
import gestionScolaire.metier.model.Etablissement;

@Controller  
@RequestMapping("/calendar")  
public class CalendarController {
	
	@Autowired
	private EtablissementDao etablissementDao;
	
	@RequestMapping(method = RequestMethod.GET)
	   public String printHello(ModelMap model) {
		List<Etablissement> etablissements = etablissementDao.findAll();
		
		model.addAttribute("etablissements", etablissements);
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
