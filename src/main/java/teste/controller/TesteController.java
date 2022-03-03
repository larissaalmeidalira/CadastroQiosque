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
        System.out.println(dados.getDataNascimento());
		DaoCadastro dao = new DaoCadastro();
		
		if(dados.getId()==null)  {
			dao.inserir(dados);
		}else {
			dao.atualizar(dados);
		}
		
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
	public String excluir(Long id) {
		DaoCadastro dao = new DaoCadastro();
		dao.excluir(id);
		return "redirect:listarCadastrados";
	}
	
	@RequestMapping("alterarCadastro")
	public String alterar(Long id, Model model) {
		DaoCadastro dao = new DaoCadastro();
		model.addAttribute("dados", dao.buscar(id));
		
		return "forward:index";
	}
	
	@RequestMapping("Estatisticas")
	
	public String contador(Model model) {
		
		DaoCadastro dao = new DaoCadastro();
		model.addAttribute("dados", dao.contador());

	
		
		return "estatisticas";
	}
	
	
}

