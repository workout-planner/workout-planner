package Servelet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import Repository.ItensPlanilhaRepository;
import Repository.PersonalRepository;
import Repository.PlanilhaExercicioRepository;
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
		Dao<Pessoa, Integer> daoAluno = new Dao<Pessoa,Integer>();
		PlanilhaExercicioRepository planilha = new PlanilhaExercicioRepository();
		
		int id = Integer.parseInt(request.getParameter("id"));
		Pessoa pessoa = daoAluno.findById(Pessoa.class, id).get();
		
		Aluno aluno = (Aluno) pessoa;
		List<PlanilhaExercicio> plan = planilha.buscarPlanilhasUsuario(aluno);
		
		if (!plan.isEmpty())
		{
			request.setAttribute("error", "Esse aluno possui planilhas relacionadas a ele.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("IndexUsuarios.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			daoAluno.delete(pessoa);
			
			response.sendRedirect(("IndexUsuarios.jsp"));
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("alunoId") == null)
		{
			String tipoUsuario = request.getParameter("tipoPessoa");
			if ((tipoUsuario.equals("ALUNO")))
			{
				Dao<Aluno, Integer> daoAluno = new Dao<Aluno, Integer>();
				AlunoRepository _repositorio = new AlunoRepository();
				
				String matricula = request.getParameter("matricula");
				
				Pessoa usuarioMatriculaJaRelacionado = _repositorio.buscarPorMatricula(matricula); 
				if (usuarioMatriculaJaRelacionado != null)
				{
					request.setAttribute("message", "Essa matricula já está relacionada a um usuario");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastrarAluno.jsp");
					dispatcher.forward(request, response);
				}
				
				Aluno aluno = new Aluno();
				aluno.setMatricula(matricula);
				aluno.setNome(request.getParameter("nome"));
				aluno.setPlano(request.getParameter("plano"));
				aluno.setDataNascimento(LocalDate.parse(request.getParameter("dataNascimento")));
				aluno.setSenha(request.getParameter("senha"));
				
				daoAluno.save(aluno);
				request.setAttribute("sucesso", "Aluno cadastrado com sucesso");
			}
			else {
				Dao<Personal, Integer> daoPersonal = new Dao<Personal, Integer>();
				PersonalRepository _repository = new PersonalRepository();
				
				int cbo = Integer.parseInt(request.getParameter("cbo"));
				Pessoa personalJaRelacionadoCbo = _repository.buscarPorCbo(cbo);
				if (personalJaRelacionadoCbo != null)
				{
					request.setAttribute("message", "Essa cbo já está relacionada a um usuario");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastrarPersonal.jsp");
					dispatcher.forward(request, response);
				}
				
				Personal personal = new Personal();
				personal.setNome(request.getParameter("nome"));
				personal.setCBO(cbo);
				personal.setArea(request.getParameter("area"));
				personal.setDataNascimento(LocalDate.parse(request.getParameter("dataNascimento")));
				personal.setSenha(request.getParameter("senha"));
				
				daoPersonal.save(personal);
				request.setAttribute("sucesso", "Personal cadastrado com sucesso");
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/telaLogin.jsp");
			dispatcher.forward(request, response);
		}
		else {
			Dao<Aluno, Integer> daoAluno = new Dao<Aluno, Integer>();
			int alunoId = Integer.parseInt(request.getParameter("alunoId"));
			Aluno aluno = new Aluno();
			aluno.setId(alunoId);
			aluno.setMatricula(request.getParameter("matricula"));
			aluno.setNome(request.getParameter("nome"));
			aluno.setPlano(request.getParameter("plano"));
			aluno.setDataNascimento(LocalDate.parse(request.getParameter("dataNascimento")));
			aluno.setSenha(request.getParameter("senha"));
			
			daoAluno.update(aluno);
			response.sendRedirect(("IndexUsuarios.jsp"));
		}
	}
}
