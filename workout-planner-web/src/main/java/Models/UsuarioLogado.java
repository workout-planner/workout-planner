package Models;

public class UsuarioLogado extends Pessoa {
	private static Pessoa usuarioLogado;
	private UsuarioLogado() {};
	
	public static void setUsuarioLogado(Pessoa usarioLogado) {
		usuarioLogado = usarioLogado;
	}
	
	public static Pessoa getUsuarioLogado() {
		return usuarioLogado;
	}
}