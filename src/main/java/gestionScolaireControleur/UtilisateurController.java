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
import gestionScolaire.metier.dao.UtilisateurDao;
import gestionScolaire.metier.model.Etablissement;
import gestionScolaire.metier.model.Matiere;
import gestionScolaire.metier.model.Utilisateur;

@Controller
@RequestMapping("/utilisateur")
public class UtilisateurController {

	@Autowired
	private UtilisateurDao utilisateurDao;
	
	@Autowired
	private EtablissementDao etablissementDao;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Utilisateur> utilisateurs = utilisateurDao.findAll();
		
		model.addAttribute("utilisateurs", utilisateurs);
		
		return "utilisateur/utilisateur";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		List<Etablissement> etablissements = etablissementDao.findAll();
		model.addAttribute("etablissements", etablissements);
		model.addAttribute("utilisateur", new Utilisateur());

		return "utilisateur/utilisateurEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Utilisateur utilisateur = utilisateurDao.find(id);
		List<Etablissement> etablissements = etablissementDao.findAll();
		model.addAttribute("etablissements", etablissements);
		model.addAttribute("utilisateur", utilisateur);

		return "utilisateur/utilisateurEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("utilisateur") Utilisateur utilisateur) {

		if (utilisateur.getId() == null) {
			utilisateurDao.create(utilisateur);
		} else {
			utilisateurDao.update(utilisateur);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Utilisateur utilisateur = utilisateurDao.find(id);
		utilisateurDao.delete(utilisateur);

		return "forward:list";
	}
}
