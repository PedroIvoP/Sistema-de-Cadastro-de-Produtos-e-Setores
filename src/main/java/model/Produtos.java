package model;

public class Produtos {

	private int produtoId;
	private String nome;
	private double preco;
	private int setorId;
	
	
	
	public Produtos() {
	}

	public Produtos(int produtoId, String nome, double preco, int setorId) {
		this.produtoId = produtoId;
		this.nome = nome;
		this.preco = preco;
		this.setorId = setorId;
	}

	public Produtos(String nome, double preco, int setorId) {
		this.nome = nome;
		this.preco = preco;
		this.setorId = setorId;
	}

	public int getProdutoId() {
		return produtoId;
	}

	public void setProdutoId(int produtoId) {
		this.produtoId = produtoId;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public int getSetorId() {
		return setorId;
	}

	public void setSetorId(int setorId) {
		this.setorId = setorId;
	}
	
	
}
