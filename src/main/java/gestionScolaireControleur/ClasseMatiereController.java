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
import gestionScolaire.metier.dao.ClasseMatiereDao;
import gestionScolaire.metier.dao.MatiereDao;
import gestionScolaire.metier.model.Classe;
import gestionScolaire.metier.model.ClasseMatiere;
import gestionScolaire.metier.model.Matiere;

@Controller
@RequestMapping("/classeMatiere")
public class ClasseMatiereController {

	@Autowired
	private ClasseMatiereDao classeMatiereDao;
	
	@Autowired
	private MatiereDao matiereDao;
	
	@Autowired
	private ClasseDao classeDao;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<ClasseMatiere> classeMatieres = classeMatiereDao.findAll();
		
		model.addAttribute("classeMatieres", classeMatieres);
		
		return "classeMatiere/classeMatiere";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		List<Matiere> matieres = matiereDao.findAll();
		List<Classe> classes = classeDao.findAll();
		model.addAttribute("classes", classes);
		model.addAttribute("matieres", matieres);
		model.addAttribute("classeMatiere", new ClasseMatiere());

		return "classeMatiere/classeMatiereEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		List<Matiere> matieres = matiereDao.findAll();
		List<Classe> classes = classeDao.findAll();
		model.addAttribute("classes", classes);
		model.addAttribute("matieres", matieres);
		
		ClasseMatiere classeMatiere = classeMatiereDao.find(id);
		model.addAttribute("classeMatiere", classeMatiere);

		return "classeMatiere/classeMatiereEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("classeMatiere") ClasseMatiere classeMatiere) {

		if (classeMatiere.getId() == null) {
			classeMatiereDao.create(classeMatiere);
		} else {
			classeMatiereDao.update(classeMatiere);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		ClasseMatiere classeMatiere = classeMatiereDao.find(id);
		classeMatiereDao.delete(classeMatiere);

		return "forward:list";
	}
}
