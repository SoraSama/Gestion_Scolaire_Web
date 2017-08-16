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
import gestionScolaire.metier.dao.ClasseProfesseurDao;
import gestionScolaire.metier.dao.ProfesseurDao;
import gestionScolaire.metier.model.Classe;
import gestionScolaire.metier.model.ClasseProfesseur;
import gestionScolaire.metier.model.Professeur;

@Controller
@RequestMapping("/classeProfesseur")
public class ClasseProfesseurController {

	@Autowired
	private ClasseProfesseurDao classeProfesseurDao;
	
	@Autowired
	private ProfesseurDao professeurDao;
	
	@Autowired
	private ClasseDao classeDao;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<ClasseProfesseur> classeProfesseurs = classeProfesseurDao.findAll();
		
		model.addAttribute("classeProfesseurs", classeProfesseurs);
		
		return "classeProfesseur/classeProfesseur";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		List<Professeur> professeurs = professeurDao.findAll();
		List<Classe> classes = classeDao.findAll();
		model.addAttribute("classes", classes);
		model.addAttribute("professeurs", professeurs);
		model.addAttribute("classeProfesseur", new ClasseProfesseur());

		return "classeProfesseur/classeProfesseurEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		List<Professeur> professeurs = professeurDao.findAll();
		List<Classe> classes = classeDao.findAll();
		model.addAttribute("classes", classes);
		model.addAttribute("professeurs", professeurs);
		
		ClasseProfesseur classeProfesseur = classeProfesseurDao.find(id);
		model.addAttribute("classeProfesseur", classeProfesseur);

		return "classeProfesseur/classeProfesseurEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("classeProfesseur") ClasseProfesseur classeProfesseur) {

		if (classeProfesseur.getId() == null) {
			classeProfesseurDao.create(classeProfesseur);
		} else {
			classeProfesseurDao.update(classeProfesseur);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		ClasseProfesseur classeProfesseur = classeProfesseurDao.find(id);
		classeProfesseurDao.delete(classeProfesseur);

		return "forward:list";
	}
}
