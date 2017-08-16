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
import gestionScolaire.metier.dao.MatiereDao;
import gestionScolaire.metier.dao.SalleDao;
import gestionScolaire.metier.model.Etablissement;
import gestionScolaire.metier.model.Matiere;
import gestionScolaire.metier.model.Salle;

@Controller
@RequestMapping("/salle")
public class SalleController {
	@Autowired
	private SalleDao salleDao;
	
	@Autowired
	private EtablissementDao etablissementDao;
	
	@Autowired
	private MatiereDao matiereDao;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Salle> salles = salleDao.findAll();
		model.addAttribute("salles", salles);
		
		return "salle/salle";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		List<Matiere> matieres = matiereDao.findAll();
		List<Etablissement> etablissements = etablissementDao.findAll();
		model.addAttribute("matieres", matieres);
		model.addAttribute("etablissements", etablissements);
		model.addAttribute("salle", new Salle());

		return "salle/salleEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Salle salle = salleDao.find(id);
		List<Etablissement> etablissements = etablissementDao.findAll();
		List<Matiere> matieres = matiereDao.findAll();
		model.addAttribute("matieres", matieres);
		model.addAttribute("etablissements", etablissements);
		model.addAttribute("salle", salle);

		return "salle/salleEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("salle") Salle salle) {

		if (salle.getId() == null) {
			salleDao.create(salle);
		} else {
			salleDao.update(salle);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Salle salle = salleDao.find(id);
		salleDao.delete(salle);

		return "forward:list";
	}
}
