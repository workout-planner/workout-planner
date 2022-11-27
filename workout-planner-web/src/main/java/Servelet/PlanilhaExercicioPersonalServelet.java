package Servelet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Exercicio;
import Models.ItensPlanilha;
import Models.PlanilhaExercicio;
import Models.UsuarioLogado;
import Repository.ItensPlanilhaRepository;

/**
 * Servlet implementation class PlanilhaExercicioPersonalServelet
 */
@WebServlet("/PlanilhaExercicioPersonalServelet")
public class PlanilhaExercicioPersonalServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanilhaExercicioPersonalServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao.Dao<PlanilhaExercicio, Integer> daoPlanilha = new Dao.Dao<PlanilhaExercicio, Integer>();
		Dao.Dao<ItensPlanilha, Integer> daoItens = new Dao.Dao<ItensPlanilha, Integer>();
		ItensPlanilhaRepository _repositorio = new ItensPlanilhaRepository();
		
		int planilhaId = Integer.parseInt(request.getParameter("id"));
		PlanilhaExercicio planilha = daoPlanilha.findById(PlanilhaExercicio.class, planilhaId).get();
		
		List<ItensPlanilha> itens = _repositorio.BuscarPorPlanilha(planilha);
		for (ItensPlanilha item : itens )
		{
			ItensPlanilha itemDelete = daoItens.findById(ItensPlanilha.class, item.getId()).get();
			daoItens.delete(itemDelete);
		}
		
		daoPlanilha.delete(planilha);
		response.sendRedirect(("PlanilhasIndex.jsp"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
