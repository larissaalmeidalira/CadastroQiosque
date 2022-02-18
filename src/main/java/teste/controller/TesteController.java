package teste.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import teste.dao.DaoCadastro;
import teste.model.Cliente;
import teste.model.TipoProduto;


@Controller
public class TesteController {
	
	//metodo que retorna a pagina do formulario
	
	@RequestMapping("index") 
	
	public String index (Model model) {
		model.addAttribute("tipos", TipoProduto.values());
		return "index"; 
	}
	
	//metodo para salvar os dados
	@RequestMapping("salvarCadastrado")
	public String salvarCadastro(Cliente dados) {
		System.out.println(dados.getNome());
		System.out.println(dados.getEmail());
		System.out.println(dados.getTelefone());
		System.out.println(dados.getGenero());
        System.out.println(dados.getEndereco());
        System.out.println(dados.getProdutos());
		
		DaoCadastro dao = new DaoCadastro();
		dao.inserir(dados);
		
		return "redirect:listarCadastrados";
		
	}
	
	// metodo para listar 
	
	@RequestMapping("listarCadastrados")
	public String listarProdutos(Model model) {
		DaoCadastro dao = new DaoCadastro();
		model.addAttribute("dados", dao.listar());
		
		return "listar";
		
	}
	
	@RequestMapping("excluirCadastro")
	public String excluir(Long idProduto) {
		DaoCadastro dao = new DaoCadastro();
		dao.excluir(idProduto);
		return "redirect:listarCadastrados";
	}
	
	/*@RequestMapping("alterarCadastro")
	public String alterar(Long idProduto, Model model) {
		DaoCadastro dao = new DaoCadastro();
		model.addAttribute("produtos", dao.buscar(idProduto));
		
		return "forward: index";
	}*/
	
	
	
}
