package gestionScolaireControleur;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gestionScolaire.metier.dao.ClasseDao;
import gestionScolaire.metier.dao.EtablissementDao;
import gestionScolaire.metier.model.Classe;
import gestionScolaire.metier.model.Etablissement;

@Controller
@RequestMapping("/classe")
public class ClasseController {
	@Autowired
	private ClasseDao classeDao;
	
	@Autowired
	private EtablissementDao etablissementDao;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Classe> classes = classeDao.findAll();
		
		model.addAttribute("classes", classes);
		
		return "classe/classe";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		List<Etablissement> etablissements = etablissementDao.findAll();
		model.addAttribute("etablissements", etablissements);
		model.addAttribute("classe", new Classe());

		return "classe/classeEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Classe classe = classeDao.find(id);
		List<Etablissement> etablissements = etablissementDao.findAll();
		model.addAttribute("etablissements", etablissements);
		model.addAttribute("classe", classe);

		return "classe/classeEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("classe") Classe classe) {

		if (classe.getId() == null) {
			classeDao.create(classe);
		} else {
			classeDao.update(classe);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Classe classe = classeDao.find(id);
		classeDao.delete(classe);

		return "forward:list";
	}
}
