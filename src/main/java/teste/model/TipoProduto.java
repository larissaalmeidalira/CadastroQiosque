package teste.model;

public enum TipoProduto {
	
	SORVETE_POTE("Sorvete de Pote"), PICOLE("Picolé"), GELADINHO("Geladinho"), CASQUINHA("Casquinha");
	
	String desc;
	
	private TipoProduto(String desc) {
		this.desc = desc;
	}
	
	@Override
	public String toString() {
		return this.desc;
	}
	
}
