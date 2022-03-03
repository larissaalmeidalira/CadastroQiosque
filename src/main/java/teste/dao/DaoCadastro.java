package teste.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import teste.model.Cliente;
import teste.model.Estatistica;


public class DaoCadastro {

	private Connection conexao;

	

	public DaoCadastro() {

		conexao = ConnectionFactory.conectar();

	}


	public void inserir(Cliente dados) {

		String sql = "INSERT INTO clientes(nome, email, telefone, genero, endereco, data_nascimento, dataCadastro) VALUES (?,?,?,?,?,?,?)";

		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, dados.getNome());
			stmt.setString(2, dados.getEmail());
			stmt.setString(3, dados.getTelefone());
			stmt.setString(4, dados.getGenero());
			stmt.setString(5, dados.getEndereco());
			stmt.setDate(6, new Date(dados.getDataNascimento().getTimeInMillis()));
			Calendar dataC = Calendar.getInstance();
			dados.setDataCadastro(dataC);
			stmt.setTimestamp(7, new Timestamp(dados.getDataCadastro().getTimeInMillis()));
			stmt.execute();
			stmt.close();
			conexao.close();

		} catch (SQLException e) {

			throw new RuntimeException(e);

		}
	}

	public void atualizar(Cliente dados) {
		String sql = "update clientes set nome = ?, email = ?, telefone = ?, genero = ?, endereco = ?, data_nascimento = ? where id = ?";

		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, dados.getNome());
			stmt.setString(2, dados.getEmail());
			stmt.setString(3, dados.getTelefone());
			stmt.setString(4, dados.getGenero());
			stmt.setString(5, dados.getEndereco());
			stmt.setDate(6, new Date(dados.getDataNascimento().getTimeInMillis()));
			stmt.setLong(7, dados.getId());
			stmt.execute();
			stmt.close();
			conexao.close();

		} catch (SQLException e) {

			throw new RuntimeException(e);
		}
	}

	public Cliente buscar(Long id) {
		String sql = "select * from clientes where id = ?";
		Cliente c = null;
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				c = new Cliente();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));
				c.setGenero(rs.getString("genero"));
				c.setEndereco(rs.getString("endereco"));

				Calendar nascimento = Calendar.getInstance();
				Date datanascimento = rs.getDate("data_nascimento");
				nascimento.setTimeInMillis(datanascimento.getTime());
				c.setDataNascimento(nascimento);
				
				Calendar gc = Calendar.getInstance();
				Timestamp dataCad = rs.getTimestamp("dataCadastro");
				gc.setTimeInMillis(dataCad.getTime());
				c.setDataCadastro(gc);
				
				

			}

			rs.close();
			stmt.close();
			conexao.close();
			return c;

		} catch (Exception e) {

			throw new RuntimeException(e);
		}
	}

	public List<Cliente> listar() {
		String sql = "select * from clientes order by dataCadastro asc";
		List<Cliente> lista = new ArrayList<Cliente>();
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Cliente c = new Cliente();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));
				c.setGenero(rs.getString("genero"));
				c.setEndereco(rs.getString("endereco"));

				Calendar nascimento = Calendar.getInstance();
				Date datanascimento = rs.getDate("data_nascimento");
				nascimento.setTimeInMillis(datanascimento.getTime());
				c.setDataNascimento(nascimento);
				
				Calendar gc = Calendar.getInstance();
				Timestamp dataCad = rs.getTimestamp("dataCadastro");
				gc.setTimeInMillis(dataCad.getTime());
				c.setDataCadastro(gc);
				
				
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
	
	

	public Estatistica contador() {
		
		// GENERO
		String sql = "SELECT genero, data_nascimento, dataCadastro FROM clientes";
		Estatistica f = null;
		Cliente c = null;
		
		
		
		PreparedStatement stmt;
		try {
			f = new Estatistica();

			stmt = conexao.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			// qtd genero
			int qtdF = 0;
			int qtdM = 0;
			
			
			// qtd faixa etária
			Calendar dataAtual = Calendar.getInstance();
			int anoAtual = dataAtual.get(Calendar.YEAR);

			int jovem = 0;
			int adulto = 0;
			int idoso = 0;
			int idade;
			
			// qtd periodo do dia

			int manha=0;
			int tarde=0;
			int noite=0;
			
			
			// qtd dias da semana
			int seg=0;
			int ter=0;
			int qua=0;
			int qui=0;
			int sex=0;
			int sab=0;
			int dom=0;
			
			
			
			while (rs.next()) {
				c = new Cliente();

				c.setGenero(rs.getString("genero"));
				if (c.getGenero().equals("Feminino")) {
					qtdF++;

				} else {
					qtdM++;

				}
				
				Calendar nascimento = Calendar.getInstance();
				Date datanascimento = rs.getDate("data_nascimento");
				nascimento.setTimeInMillis(datanascimento.getTime());
				c.setDataNascimento(nascimento);
				
				int anoNasc = nascimento.get(Calendar.YEAR);
				idade = anoAtual - anoNasc;
				if (idade < 22) {
					jovem++;
				} else if (idade < 60) {
					adulto++;
				} else {
					idoso++;
				}
				
				
				Calendar gc = Calendar.getInstance();
				Timestamp dataCad = rs.getTimestamp("dataCadastro");
				gc.setTimeInMillis(dataCad.getTime());
				c.setDataCadastro(gc);
				
				switch (gc.get(Calendar.DAY_OF_WEEK)) {
				case Calendar.MONDAY:
					seg++;
					break;
				case Calendar.TUESDAY:
					ter++;
					break;
				case Calendar.WEDNESDAY:
					qua++;
					break;
				case Calendar.THURSDAY:
					qui++;
					break;
				case Calendar.FRIDAY:
					sex++;
					break;
				case Calendar.SATURDAY:
					sab++;
					break;
				case Calendar.SUNDAY:
					dom++;
					break;
				default:
					break;
				}
				
				
				if(gc.get(Calendar.HOUR_OF_DAY) < 12) {
					manha++;
				}else if(gc.get(Calendar.HOUR_OF_DAY) < 18){
					tarde++;
				}else {
					noite++;
				}
			}

			f.setQtdFeminino(qtdF);

			f.setQtdMasculino(qtdM);
			
			f.setJovem(jovem);
			f.setAdulto(adulto);
			f.setIdoso(idoso);
			
			f.setSeg(seg);
			f.setTer(ter);
			f.setQua(qua);
			f.setQui(qui);
			f.setSex(sex);
			f.setSab(sab);
			f.setDom(dom);
			
			f.setManha(manha);
			f.setTarde(tarde);
			f.setNoite(noite);
			
			stmt.execute();
			rs.close();
			stmt.close();
			conexao.close();
			
		} catch (Exception e) {

			throw new RuntimeException(e);
		}

		return f;

	}

}
