package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import objects.Carpoolinfo;
import objects.User_pswd;
import objects.Userinfo;

/**
 * Servlet implementation class PageControl
 */
@WebServlet("*.do")
public class PageControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = request.getServletPath();
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String password2 = request.getParameter("password2");
		String wechat = request.getParameter("wechat");
		String school = request.getParameter("school");
		String role = request.getParameter("role");
		
		String departuretime = request.getParameter("departuretime");
		String departureplace = request.getParameter("departureplace");
		String destination = request.getParameter("destination");
		String targetnum = request.getParameter("targetnum");
		String currentnum = request.getParameter("currentnum");
		String message=null;
		
		User_pswd upswd= new User_pswd();
		Userinfo userinfo = new Userinfo();
		Carpoolinfo car = new Carpoolinfo();
		
//		List cars = car.getAllcarpools();
//		if(cars!=null) {
//			for(Object o:cars) {
//				Map cs=(Map)o;
//				try {
//					SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd HH:mm");
//					Date chufa = df.parse((String) cs.get("departuretime"));
//					Date date1 = new Date();//当前时间
//					chufa = df.parse(departuretime);//出发时间
//					if(chufa.before(date1)) {//出发时间比现在早
//						car.setState2("拼车失败");
//						car.updateState2();
//					}
//				} catch (ParseException e) {
//					// TODO 自动生成的 catch 块
//					e.printStackTrace();
//				}
//			}
//		}
		
		
		if(url.equals("/Pages/login.do")) {
			upswd.setAccount(account);
			if(role.equals("common")) {//普通用户验证
				Map User = upswd.getUser();
				if(User == null) {//用户不存在
					message="账号错误！<a href='login.jsp'>返回</a>";
					request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
				}else {
					String userpswd =(String)User.get("password"); 
					if(userpswd.equals(password)) {
						String userid =(String)User.get("userid"); 
						userinfo.setUserid(userid);
						Map user = userinfo.getUserInfo();
						HttpSession session = request.getSession();
						session.setAttribute("userinfo", user);
						session.setAttribute("role", role);
						request.getRequestDispatcher("/Pages/index.jsp?role="+role).forward(request, response);
					}else {
						message="密码错误！<a href='login.jsp'>返回</a>";
						request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
					}
				}
			}else if(role.equals("admin")) {//管理员验证
				Map Admin = upswd.getAdmin();
				if(Admin == null) {//用户不存在
					message="账号错误！<a href='login.jsp'>返回</a>";
					request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
				}else {
					String userpswd =(String)Admin.get("password"); 
					if(userpswd.equals(password)) {
						String userid =(String)Admin.get("userid"); 
						userinfo.setUserid(userid);
						Map admin = userinfo.getAdminInfo();
						HttpSession session = request.getSession();
						session.setAttribute("admininfo", admin);
						session.setAttribute("role", role);
						request.getRequestDispatcher("/Pages/index.jsp?role="+role).forward(request, response);
					}else {
						message="密码错误！<a href='login.jsp'>返回</a>";
						request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
					}
				}
			}
		}else if(url.equals("/Pages/register.do")) {//注册
			upswd.setAccount(account);upswd.setPassword(password2);
			if(upswd.getUser()!=null) {
				message="用户已存在！<a href='register.jsp'>返回</a>";
				request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
			}else {
				int result = upswd.addUser();//添加到账号密码表
				if(result!=0) {
//					Map count=upswd.getCount();
//					String c=(String)count.get("count");
//					HttpSession session=request.getSession();
//					Map userinf=(Map)session.getAttribute("userinfo");
//					String userid=(String)userinf.get("userid");
//					userinfo.setUserid(userid);
				    Map	u = upswd.getUser();
					String id=(String)u.get("userid");
					userinfo.setUserid(id);
					userinfo.setUsername(username);userinfo.setTel(tel);
					userinfo.setEmail(email);userinfo.setWechat(wechat);userinfo.setSchool(school);
					int r=userinfo.addUser();
					if(r!=0) {
						message="注册成功！<a href='login.jsp'>登录</a>";
						request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
					}else {
						message="个人信息添加失败！<a href='login.jsp'>登录</a>";
						request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
					}
				}else {
					message="注册失败！<a href='register.jsp'>返回</a>";
					request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
				}
			}
		
		}else if(url.equals("/Pages/addCarpool.do")) {//发起拼车
			HttpSession session = request.getSession();
			String userid =(String) session.getAttribute("userid");
			Date date = new Date();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now=dateFormat.format(date);
			car.setUserid(userid);car.setSendtime(now);
			car.setDeparturetime(departuretime);
			car.setDepartureplace(departureplace);
			car.setDestination(destination);
			car.setTargetnum(targetnum);
			car.setCurrentnum(currentnum);
			int result = car.addCarpool();
			if(result!=0) {
					message="发起成功！<a href='index.jsp'>返回主页</a>";
					request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
//				} 
			}else {
				message="发起失败！<a href='index.jsp'>返回主页</a>";
				request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
			}
				
	   }else if(url.equals("/Pages/updateUser.do")) {//修改个人信息
		    String userid=request.getParameter("userid");
			userinfo.setUserid(userid);userinfo.setUsername(username);
			userinfo.setTel(tel);userinfo.setEmail(email);
			userinfo.setWechat(wechat);userinfo.setSchool(school);
			int result = userinfo.updateUser();
//			System.out.println(result);
			if(result!=0) {
				Map user = userinfo.getUserInfo();
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", user);
				message="修改成功！<a href='userPage.jsp'>返回个人主页</a>";
				request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
			}else {
				message="修改失败！<a href='userPage.jsp'>返回个人主页</a>";
				request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
			}
		}else if(url.equals("/Pages/updatePswd.do")) {//修改密码
			    String userid=request.getParameter("userid");
				String password1 = request.getParameter("password1");
//				System.out.println(password+' '+password1);
			    if(password.equals(password1)) {
			    	upswd.setUserid(userid);upswd.setPassword(password2);
					int result = upswd.updateUser();
					if(result!=0) {
						message="修改成功！<a href='login.jsp'>登录</a>";
						request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
					}else {
						message="修改失败！<a href='updatePswd.jsp'>返回</a>";
						request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
					}
			    }else {
			    	message="密码错误！<a href='updatePswd.jsp'>返回</a>";
					request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
			    }
			    
		}else if(url.equals("/Pages/searchp.do")) {//按地址查询
		    car.setDepartureplace(departureplace);
		    car.setDestination(destination);
		    List c = car.getCarpool_p();
		    HttpSession session = request.getSession();
			session.setAttribute("carpool_p", c);
			request.getRequestDispatcher("/Pages/searchCarpool_p.jsp?").forward(request, response);
		}else if(url.equals("/Pages/searcht.do")) {//按时间查询
			String t1 = request.getParameter("t1");
			String t2 = request.getParameter("t2");
		    List c = car.getCarpool_t(t1,t2);
		    HttpSession session = request.getSession();
			session.setAttribute("carpool_t", c);
			request.getRequestDispatcher("/Pages/searchCarpool_t.jsp?").forward(request, response);
		}else if(url.equals("/Pages/editCarpool.do")) {//修改拼车信息
			Date date = new Date();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now=dateFormat.format(date);
			String carid = request.getParameter("carid");
			car.setSendtime(now);
			car.setDeparturetime(departuretime);
			car.setDepartureplace(departureplace);
			car.setDestination(destination);
			car.setTargetnum(targetnum);
			car.setCurrentnum(currentnum);
			car.setCarid(carid);
			int result = car.updateCarpool();
			if(result!=0) {
				message="修改成功！<a href='userSend.jsp'>返回</a>";
				request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
			}else {
				message="修改失败！<a href='userSend.jsp'>返回</a>";
				request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
			}
		}else if(url.equals("/Pages/join.do")) {//更新拼车状态1
			Date date = new Date();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now=dateFormat.format(date);
			String carid = request.getParameter("carid");
			car.setSendtime(now);
			car.setDeparturetime(departuretime);
			car.setDepartureplace(departureplace);
			car.setDestination(destination);
			car.setTargetnum(targetnum);
			car.setCurrentnum(currentnum);
			car.setCarid(carid);
			int result = car.updateCarpool();
			if(result!=0) {
				message="更新成功！<a href='userSend.jsp'>返回</a>";
				request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
			}else {
				message="更新失败！<a href='userSend.jsp'>返回</a>";
				request.getRequestDispatcher("/Pages/message.jsp?message="+message).forward(request, response);
			}
		}
	
	
	}

}
