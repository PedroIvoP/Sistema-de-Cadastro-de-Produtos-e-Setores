package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import services.BDConn;

public class Produtos {
	
		//CONSULTAR todos os model.Produtos------------------------------------------------
		public static ArrayList<model.Produtos> getAll() {
			ArrayList<model.Produtos> JavaBeanss = new ArrayList<model.Produtos>();
			
			BDConn banco = new BDConn();
			banco.conecta();
			
			try {
				String sql = "SELECT * FROM produtos ORDER BY setorId, nome;";
				
				//prepara o comando do SQL
				PreparedStatement ps = banco.getConn().prepareStatement(sql);
				
				//executa o comando SQL
				ResultSet resultado = ps.executeQuery();
				
				//enquanto tiver um próximo resultado
				//lembrando que ele inicia sem nenhum selecionado
				while(resultado.next()) {
					JavaBeanss.add(new model.Produtos(resultado.getInt("produtoId"),
										 resultado.getString("nome"),
										 resultado.getDouble("preco"),
										 resultado.getInt("setorId")));
				}
				banco.desconecta();//NUNCA ESQUECER DE FECHAR A CONEXÃO
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return JavaBeanss; 
		}
		//--------------------------------------------------------------------------
		
		//INSERIR model.Produtos--------------------------------------------------------------
		public static boolean addProduto(model.Produtos a) {
			BDConn banco = new BDConn();
			banco.conecta();
			
			try {
				String sql = "INSERT INTO produtos (nome, preco, setorId) VALUES (?,?,?);";

				PreparedStatement ps = banco.getConn().prepareStatement(sql);
				ps.setString(1, a.getNome());
				ps.setDouble(2, a.getPreco());
				ps.setInt(3, a.getSetorId());
			
				ps.executeUpdate();
				//update insere, deleta e atualiza. Ou seja, altera o banco
				banco.desconecta();
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		//--------------------------------------------------------------------------
		
			//Atualiza produto por id--------------------------------------------------------
			public static boolean updtProduto(int id, String nome, double preco, int setorId) {
			BDConn banco = new BDConn();
			banco.conecta();



			try {

			String sql = "UPDATE produtos SET nome = ? , preco = ? , setorId = ? WHERE produtoId = ?";

			PreparedStatement ps = banco.getConn().prepareStatement(sql);
			ps.setString(1,nome);
			ps.setDouble(2, preco);
			ps.setInt(3, setorId);
			ps.setInt(4, id);

			ps.executeUpdate();
			banco.desconecta();
			return true;
			} catch (SQLException e) {
			e.printStackTrace();
			}

			return false;



			}
			//--------------------------------------------------------------------------

			//Apaga produto por id--------------------------------------------------------
			public static boolean deleteProdutoById(int id) {
			BDConn banco = new BDConn();
			banco.conecta();



			try {


			String sql = "DELETE FROM produtos WHERE produtoId = ?";

			PreparedStatement ps = banco.getConn().prepareStatement(sql);
			ps.setInt(1, id);

			ps.executeUpdate();
			banco.desconecta();
			return true;
			} catch (SQLException e) {
			e.printStackTrace();
			}
			return false;
			}
			//-----------------------------------------------------------------------------------
			
			
			//Pega um p pelo ID------------------------------------------------
			public static model.Produtos getProdutoById(int id) {
				
				ArrayList<model.Produtos> JavaBeanss = new ArrayList<model.Produtos>();
				
				BDConn banco = new BDConn();
				banco.conecta();
				
				model.Produtos c = new model.Produtos();
				
				try {
					String sql = "SELECT * FROM produtos where produtoId = " + id + ";";
					
					//prepara o comando do SQL
					PreparedStatement ps = banco.getConn().prepareStatement(sql);
					
					//executa o comando SQL
					ResultSet resultado = ps.executeQuery();
					
					//enquanto tiver um próximo resultado
					//lembrando que ele inicia sem nenhum selecionado
					
					
					
					while(resultado.next()) {
						c = new model.Produtos(resultado.getInt("produtoId"),
								 resultado.getString("nome"),
								 resultado.getDouble("preco"),
								 resultado.getInt("setorId"));
					}
					banco.desconecta();//NUNCA ESQUECER DE FECHAR A CONEXÃO
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return c; 
			}
			//--------------------------------------------------------------------------
}
