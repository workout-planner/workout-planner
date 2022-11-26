package Servelet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
import Models.Aluno;
import Models.Exercicio;
import Models.ItensPlanilha;
import Models.Personal;
import Models.Pessoa;
import Models.PlanilhaExercicio;
import Repository.AlunoRepository;
import Repository.PersonalRepository;

/**
 * Servlet implementation class PlanilhaExercicioServelet
 */
@WebServlet("/PlanilhaExercicioServelet")
public class PlanilhaExercicioServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanilhaExercicioServelet() {
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
		AlunoRepository _repositoryAluno = new AlunoRepository();
		PersonalRepository _repositoryPersonal = new PersonalRepository();
		Dao<PlanilhaExercicio, Integer> daoPlanilhaExercicio = new Dao<PlanilhaExercicio,Integer>();
		Dao<Exercicio, Integer> daoExercicio = new Dao<Exercicio,Integer>();
		Dao<ItensPlanilha, Integer> daoItensPlanilha = new Dao<ItensPlanilha,Integer>();
		
		PlanilhaExercicio planilhaExercicio = new PlanilhaExercicio();
		ItensPlanilha itensPlanilha;
		Exercicio exercicio;
		
		int alunoId = Integer.parseInt(request.getParameter("alunoId"));
		int personalId = Integer.parseInt(request.getParameter("personalId"));
		Pessoa usuarioAluno = _repositoryAluno.buscarPorId(alunoId);
		Pessoa usuarioPersonal = _repositoryPersonal.buscarPorId(personalId);
		Aluno aluno = (Aluno) usuarioAluno;
		Personal personal = (Personal) usuarioPersonal;
		
		planilhaExercicio.setAluno(aluno);
		planilhaExercicio.setDataInicio(LocalDate.parse(request.getParameter("dataInicio")));
		planilhaExercicio.setDataFim(LocalDate.parse(request.getParameter("dataFim")));
		planilhaExercicio.setPersonal(personal);
		planilhaExercicio = daoPlanilhaExercicio.saveReturnId(planilhaExercicio);
		
		String[] listExercicios = request.getParameterValues("exercicio");
		String[] listSeries = request.getParameterValues("series");
		String[] listRepeticoes = request.getParameterValues("repeticoes");
		String[] listDescanso = request.getParameterValues("tempoDescanso");
		
		for (int i = 0; i < listExercicios.length; i++)
		{
			exercicio = new Exercicio(); 
			exercicio = daoExercicio.findById(Exercicio.class, Integer.parseInt(listExercicios[i])).get();
			
			itensPlanilha = new ItensPlanilha();
			itensPlanilha.setPlanilhaExercicio(planilhaExercicio);
			itensPlanilha.setExercicio(exercicio);
			itensPlanilha.setRepeticoes(Integer.parseInt(listRepeticoes[i]));
			itensPlanilha.setSeries(Integer.parseInt(listSeries[i]));
			itensPlanilha.setTempoDescanso(Integer.parseInt(listDescanso[i]));
			daoItensPlanilha.save(itensPlanilha);
		}
		
		response.sendRedirect(("TelaInicialPersonal.jsp"));
	}
}