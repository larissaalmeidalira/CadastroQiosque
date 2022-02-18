package teste.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import teste.model.Cliente;
import teste.model.TipoProduto;

public class DaoCadastro {
	
	private Connection conexao;
	
	//criando conexao
	
	public DaoCadastro() {
		
		conexao = ConnectionFactory.conectar();
		
	}
	
	//metodo para inserir dados atraves do formulario
	
	public void inserir(Cliente dados) {
		
	String sql = "INSERT INTO clientes(nome, email, telefone, genero, endereco) VALUES (?,?,?,?,?)";
		
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, dados.getNome());
            stmt.setString(2, dados.getEmail());
            stmt.setString(3, dados.getTelefone());
			stmt.setString(4, dados.getGenero());
			stmt.setString(5, dados.getEndereco());
			stmt.execute();
			stmt.close();
			conexao.close();
			
		} catch (SQLException e) {
			
			
			throw new RuntimeException(e);
			
		}
	}
	
	
	public void atualizar(Cliente dados) {
		String sql = "update clientes set nome = ?, email = ?, telefone = ?, genero = ?, endereco = ? where id = ?";
		
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, dados.getNome());
            stmt.setString(2, dados.getEmail());
            stmt.setString(3, dados.getTelefone());
			stmt.setString(4, dados.getGenero());
			stmt.setString(5, dados.getEndereco());
			stmt.execute();
			stmt.close();
			conexao.close();
			
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
		}
	}
		
		
	/*public Cliente buscar(Long idProduto){
		String sql = "select * from clientes where id = ?";
		Cliente c = null;
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, idProduto);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				c = new Cliente();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));
				c.setGenero(rs.getString("genero"));
				c.setEndereco(rs.getString("endereco"));
				
				int posiEnum = rs.getInt("produto");
				TipoProduto tipo = TipoProduto.values()[posiEnum];
				c.setProdutos(tipo);
				
				
			}
			
			rs.close();
			stmt.close();
			conexao.close();
			return c;
			
		} catch (Exception e) {
			
			throw new RuntimeException(e);
		}
	}*/
	
	
	public List<Cliente> listar(){
		String sql = "select * from clientes order by nome asc";
		List<Cliente> lista = new ArrayList<Cliente>();
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Cliente c = new Cliente();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));
				c.setGenero(rs.getString("genero"));
				c.setEndereco(rs.getString("endereco"));
				
				lista.add(c);
				
			}
			
			rs.close();
			stmt.close();
			conexao.close();
			return lista;
			
		} catch (Exception e) {
			
			throw new RuntimeException(e);
		}
	}
	
	public void excluir(long id) {
		String sql = "delete from clientes where id =?";
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			stmt.execute();
			stmt.close();
			conexao.close();
			
		} catch (Exception e) {
			
			throw new RuntimeException(e);
		}
		
	}
	
	
	
	
}


