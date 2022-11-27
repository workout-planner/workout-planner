package Servelet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Personal;
import Models.Pessoa;
import Models.UsuarioLogado;
import Repository.AlunoRepository;
import Repository.PersonalRepository;

/**
 * Servlet implementation class LoginServelet
 */
@WebServlet("/LoginServelet")
public class LoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServelet() {
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
		
		if (request.getParameter("matricula") == "")
		{
			PersonalRepository personalRepository = new PersonalRepository();
			int cbo = Integer.parseInt(request.getParameter("cbo"));
			String senha = request.getParameter("senha");
			Pessoa personal = personalRepository.getForCbo(cbo, senha);
			if (personal == null)
			{
				request.setAttribute("message", "Sua cbo ou sua senha estão incorretas");
				request.setAttribute("erro", "personal");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/telaLogin.jsp");
				dispatcher.forward(request, response);
			}
			else 
			{
				UsuarioLogado.setUsuarioLogado(personal);
				response.sendRedirect(("TelaInicialPersonal.jsp"));
			}
			
		}
		else
		{
			AlunoRepository alunoRepository = new AlunoRepository();
			String matricula = request.getParameter("matricula");
			String senha = request.getParameter("senha");
			Pessoa aluno = alunoRepository.getForMatricula(matricula, senha);
			if (aluno == null)
			{
				request.setAttribute("message", "Sua matricula ou sua senha estão incorretas");
				request.setAttribute("erro", "aluno");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/telaLogin.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				UsuarioLogado.setUsuarioLogado(aluno);
				response.sendRedirect(("telaInicialAluno.jsp"));
			}
		}
			
	}

}
