package gestionScolaireControleur;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gestionScolaire.metier.dao.EtablissementDao;
import gestionScolaire.metier.dao.MatiereDao;
import gestionScolaire.metier.dao.ProfesseurDao;
import gestionScolaire.metier.model.Etablissement;
import gestionScolaire.metier.model.Matiere;
import gestionScolaire.metier.model.Professeur;

@Controller
@RequestMapping("/professeur")
public class ProfesseurController {
	@Autowired
	private ProfesseurDao professeurDao;
	
	@Autowired
	private MatiereDao matiereDao;
	
	@Autowired
	private EtablissementDao etablissementDao;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Professeur> professeurs = professeurDao.findAll();
		
		model.addAttribute("professeurs", professeurs);
		
		return "professeur/professeur";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		List<Matiere> matieres = matiereDao.findAll();
		List<Etablissement> etablissements = etablissementDao.findAll();
		model.addAttribute("etablissements", etablissements);
		model.addAttribute("matieres", matieres);
		model.addAttribute("professeur", new Professeur());

		return "professeur/professeurEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		List<Matiere> matieres = matiereDao.findAll();
		model.addAttribute("matieres", matieres);
		Professeur professeur = professeurDao.find(id);
		model.addAttribute("professeur", professeur);
		List<Etablissement> etablissements = etablissementDao.findAll();
		model.addAttribute("etablissements", etablissements);

		return "professeur/professeurEdit";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	    sdf.setLenient(true);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("professeur") Professeur professeur) {

		if (professeur.getId() == null) {
			professeurDao.create(professeur);
		} else {
			professeurDao.update(professeur);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Professeur professeur = professeurDao.find(id);
		professeurDao.delete(professeur);

		return "forward:list";
	}
}
