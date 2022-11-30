package Servelet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Exercicio;
import Models.TipoExercicio;
import Models.UsuarioLogado;


@WebServlet({ "/ExercicioServelet", "/controllerServelet" })
public class ExercicioServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExercicioServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao.Dao<Exercicio, Integer> daoExercicio = new Dao.Dao<Exercicio, Integer>();
		UsuarioLogado.getUsuarioLogado();
		int exercicioid = Integer.parseInt(request.getParameter("id"));
		Exercicio delExercicio = daoExercicio.findById(Exercicio.class, exercicioid).get();
		
		try {
			daoExercicio.delete(delExercicio);
			response.sendRedirect(("indexExercicio.jsp"));
		} catch (Exception e) {
			request.setAttribute("error", "Esse exercicio está relacionado a algumas planilhas.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("indexExercicio.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao.Dao<Exercicio, Integer> daoExercicio = new Dao.Dao<Exercicio, Integer>();

		if (request.getParameter("exercicioId") == null)
		{
			Exercicio exercicio = new Exercicio();
			exercicio = preencher(request);
			daoExercicio.save(exercicio);
		}
		else {
			int exercicioId = Integer.parseInt(request.getParameter("exercicioId"));
			Exercicio exercicioSerEditado = preencher(request);
			exercicioSerEditado.setId(exercicioId);
			daoExercicio.update(exercicioSerEditado);
		}
		
		response.sendRedirect(("indexExercicio.jsp"));
	}
	
	private Exercicio preencher(HttpServletRequest request)
	{
		Exercicio exercicio = new Exercicio();			
		exercicio.setNome(request.getParameter("nome"));
		exercicio.setDesricao(request.getParameter("descricao"));
		exercicio.setTipoExercicio( TipoExercicio.valueOf(request.getParameter("tipoExercicio")));
		return exercicio;
	}
}
