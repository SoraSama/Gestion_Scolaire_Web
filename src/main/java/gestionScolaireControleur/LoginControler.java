package gestionScolaireControleur;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gestionScolaire.metier.dao.UtilisateurDao;
import gestionScolaire.metier.model.Utilisateur;

@Controller
@RequestMapping("/login")
public class LoginControler {
	
	@Autowired
	private UtilisateurDao utilisateurDao;
	
	@RequestMapping(value= "/list")
	public String showLoginForm(){
		return "login/login";
	}
	
	@RequestMapping(value= "/loginProcess")
	public String verifyLogin(@RequestParam String userId, @RequestParam String password, HttpSession session, Model model){
		
		Utilisateur utilisateur = utilisateurDao.userConnecter(userId,password);
		
		if (utilisateur == null){ 
			model.addAttribute("loginError","Error logging in. please try again");
			return "login/login";
		}
		
		session.setAttribute("login", utilisateur);
		session.setAttribute("typeUser", utilisateur.getPremConnect());
		
		return "/accueil";
	}
	
	@RequestMapping(value= "/logout")
	public String logout(HttpSession session){
		
		session.removeAttribute("login");
		
			return "login/login";
		}
	

	
}

