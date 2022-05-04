package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import services.BDConn;

public class Setores {
	
		//CONSULTAR todos os model.Setores------------------------------------------------
		public static ArrayList<model.Setores> getAll() {
			ArrayList<model.Setores> JavaBeanss = new ArrayList<model.Setores>();
			
			BDConn banco = new BDConn();
			banco.conecta();
			
			try {
				String sql = "SELECT * FROM setores";
				
				//prepara o comando do SQL
				PreparedStatement ps = banco.getConn().prepareStatement(sql);
				
				//executa o comando SQL
				ResultSet resultado = ps.executeQuery();
				
				//enquanto tiver um próximo resultado
				//lembrando que ele inicia sem nenhum selecionado
				while(resultado.next()) {
					JavaBeanss.add(new model.Setores(resultado.getInt("setorId"),
										 resultado.getString("nome")));
				}
				banco.desconecta();//NUNCA ESQUECER DE FECHAR A CONEXÃO
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return JavaBeanss; 
		}
		//--------------------------------------------------------------------------
		
		//INSERIR model.Setores--------------------------------------------------------------
		public static boolean addSetor(String nome) {
			BDConn banco = new BDConn();
			banco.conecta();
			
			try {
				String sql = "INSERT INTO setores (nome) VALUES (?);";

				PreparedStatement ps = banco.getConn().prepareStatement(sql);
				ps.setString(1, nome);
			
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
		public static boolean updtSetor(int id, String nome) {
			BDConn banco = new BDConn();
			banco.conecta();

			try {

			String sql = "UPDATE setores SET nome = ? WHERE setorId = ?";

			PreparedStatement ps = banco.getConn().prepareStatement(sql);
			ps.setString(1,nome);
			ps.setInt(2, id);

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
		public static boolean deleteSetorById(int id) {
			BDConn banco = new BDConn();
			banco.conecta();

			try {

			String sql = "CALL Del_Setor(?)";

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
			
			
		//Pega um setor pelo ID------------------------------------------------
		public static model.Setores getSetorById(int id) {
				
				ArrayList<model.Setores> JavaBeanss = new ArrayList<model.Setores>();
				
				BDConn banco = new BDConn();
				banco.conecta();
				
				model.Setores c = new model.Setores();
				
				try {
					String sql = "SELECT * FROM setores where setorId = " + id + ";";
					
					//prepara o comando do SQL
					PreparedStatement ps = banco.getConn().prepareStatement(sql);
					
					//executa o comando SQL
					ResultSet resultado = ps.executeQuery();
					
					//enquanto tiver um próximo resultado
					//lembrando que ele inicia sem nenhum selecionado
					
					
					
					while(resultado.next()) {
						c = new model.Setores(resultado.getInt("setorId"),
								 resultado.getString("nome"));
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
