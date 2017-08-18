package gestionScolaireControleur;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gestionScolaire.metier.dao.MatiereDao;
import gestionScolaire.metier.model.Matiere;

@Controller
@RequestMapping("/matiere")
public class MatiereController {
	@Autowired
	private MatiereDao matiereDao;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Matiere> matieres = matiereDao.findAll();
		
		model.addAttribute("matieres", matieres);
		
		return "matiere/matiere";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("matiere", new Matiere());

		return "matiere/matiereEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Matiere matiere = matiereDao.find(id);
		model.addAttribute("matiere", matiere);

		return "matiere/matiereEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("matiere") Matiere matiere) {

		if (matiere.getId() == null) {
			matiereDao.create(matiere);
		} else {
			matiereDao.update(matiere);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Matiere matiere = matiereDao.find(id);
		matiereDao.delete(matiere);

		return "forward:list";
	}
}
