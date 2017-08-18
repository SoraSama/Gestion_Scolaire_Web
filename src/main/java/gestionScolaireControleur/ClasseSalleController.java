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
import gestionScolaire.metier.dao.ClasseSalleDao;
import gestionScolaire.metier.dao.SalleDao;
import gestionScolaire.metier.model.Classe;
import gestionScolaire.metier.model.ClasseSalle;
import gestionScolaire.metier.model.Salle;

@Controller
@RequestMapping("/classeSalle")
public class ClasseSalleController {

	@Autowired
	private ClasseSalleDao classeSalleDao;
	
	@Autowired
	private SalleDao salleDao;
	
	@Autowired
	private ClasseDao classeDao;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<ClasseSalle> classeSalles = classeSalleDao.findAll();
		
		model.addAttribute("classeSalles", classeSalles);
		
		return "classeSalle/classeSalle";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		List<Salle> salles = salleDao.findAll();
		List<Classe> classes = classeDao.findAll();
		model.addAttribute("classes", classes);
		model.addAttribute("salles", salles);
		model.addAttribute("classeSalle", new ClasseSalle());

		return "classeSalle/classeSalleEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		List<Salle> salles = salleDao.findAll();
		List<Classe> classes = classeDao.findAll();
		model.addAttribute("classes", classes);
		model.addAttribute("salles", salles);
		
		ClasseSalle classeSalle = classeSalleDao.find(id);
		model.addAttribute("classeSalle", classeSalle);

		return "classeSalle/classeSalleEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("classeSalle") ClasseSalle classeSalle) {

		if (classeSalle.getId() == null) {
			classeSalleDao.create(classeSalle);
		} else {
			classeSalleDao.update(classeSalle);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		ClasseSalle classeSalle = classeSalleDao.find(id);
		classeSalleDao.delete(classeSalle);

		return "forward:list";
	}
}
