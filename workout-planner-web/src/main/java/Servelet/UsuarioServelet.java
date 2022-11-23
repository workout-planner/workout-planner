package Servelet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
import Models.Aluno;
import Models.Personal;
@WebServlet({ "/UsuarioServelet", "/controllerUsuario" })
public class UsuarioServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String x = request.getParameter("tipoPessoa");
		if (request.getParameter("tipoPessoa") == "ALUNO")
		{
			Dao<Aluno, Integer> daoAluno = new Dao<Aluno, Integer>();
			
			Aluno aluno = new Aluno();
			aluno.setNome(request.getParameter("nome"));
			aluno.setMatricula(request.getParameter("matricula"));
			aluno.setPlano(request.getParameter("plano"));
			aluno.setDataNascimento(LocalDate.parse(request.getParameter("dataNascimento")));
			int exercicioId = Integer.parseInt(request.getParameter("exercicioId"));
			
			daoAluno.save(aluno);
			response.sendRedirect(("indexExercicio.jsp"));
		}
		else {
			Dao<Personal, Integer> daoPersonal = new Dao<Personal, Integer>();
			
			Personal personal = new Personal();
			personal.setNome(request.getParameter("nome"));
			personal.setCBO(Integer.parseInt(request.getParameter("cbo")));
			personal.setArea(request.getParameter("area"));
			personal.setDataNascimento(LocalDate.parse(request.getParameter("dataNascimento")));
			
			daoPersonal.save(personal);
			response.sendRedirect(("indexExercicio.jsp"));
		}
	}
}
