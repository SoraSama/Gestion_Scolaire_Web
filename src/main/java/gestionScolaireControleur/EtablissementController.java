package gestionScolaireControleur;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gestionScolaire.metier.dao.EtablissementDao;
import gestionScolaire.metier.model.Etablissement;
import gestionScolaire.metier.model.TypeEtablissement;

@Controller
@RequestMapping("/etablissement")
public class EtablissementController {
	@Autowired
	private EtablissementDao etablissementDao;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Etablissement> etablissements = etablissementDao.findAll();
		
		model.addAttribute("etablissements", etablissements);
		
		return "etablissement/etablissement";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("typeEta", TypeEtablissement.values());
		model.addAttribute("etablissement", new Etablissement());

		return "etablissement/etablissementEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Etablissement etablissement = etablissementDao.find(id);
		model.addAttribute("typeEta", TypeEtablissement.values());
		model.addAttribute("etablissement", etablissement);

		return "etablissement/etablissementEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("etablissement") Etablissement etablissement) {

		if (etablissement.getId() == null) {
			etablissementDao.create(etablissement);
		} else {
			etablissementDao.update(etablissement);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Etablissement etablissement = etablissementDao.find(id);
		etablissementDao.delete(etablissement);

		return "forward:list";
	}
}
