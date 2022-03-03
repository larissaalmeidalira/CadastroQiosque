package teste.model;

import java.util.Calendar;

import org.springframework.format.annotation.DateTimeFormat;

public class Cliente {
	private Long id;
	private String nome;
	private String email;
	private String telefone;
	private String genero;
	private String endereco;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Calendar dataNascimento;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Calendar dataCadastro;
	
	private TipoProduto produtos;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public TipoProduto getProdutos() {
		return produtos;
	}
	public void setProdutos(TipoProduto produtos) {
		this.produtos = produtos;
	}
	public Calendar getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Calendar data_nascimento) {
		this.dataNascimento = data_nascimento;
	}
	public Calendar getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(Calendar dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	
	
	

}
