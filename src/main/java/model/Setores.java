package model;

public class Setores {

	private int setorId;
	private String nome;
	
	
	
	public Setores() {
	}

	public Setores(int setorId, String nome) {
		this.setorId = setorId;
		this.nome = nome;
	}

	public Setores(String nome) {
		this.nome = nome;
	}

	public int getSetorId() {
		return setorId;
	}

	public void setSetorId(int setorId) {
		this.setorId = setorId;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
}
