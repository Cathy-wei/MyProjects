package objects;

import java.util.List;
import java.util.Map;

import connect.Connect;
public class User_pswd {
	private String userid;
	private String account;
	private String password;
	private Connect con;
	public User_pswd(){
		con = new Connect();
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	//=================用户================
//	public Map getCount() {
//		Map count=null;
//		String sql="select  count(1) count from user_pswd";
//		count = con.getMap(sql, null);
//		return count;
//	}
	public int addUser() {//添加用户/注册
		String sql = "insert into user_pswd(account,password) values(?,?)";
		String[] params = {account,password};
		int result = con.update(sql, params);
		return result;
	}
	public int updateUser() {//修改账号密码
		int result = 0;
		String sql="update user_pswd set password=? where userid=?";
		String[] params = {password,userid};
		result = con.update(sql, params);
		return result;
	}
	public Map getUser(String userid) { //查找某个用户账号密码
		Map user = null;
		String sql = "select * from user_pswd where userid=?";
		String[] params = {userid};
		user = con.getMap(sql, params);
		return user;
	}
	public Map getUser() { //查找某个用户账号密码
		Map user = null;
		String sql = "select * from user_pswd where account=?";
		String[] params = {account};
		user = con.getMap(sql, params);
		return user;
	}
	//=================管理员================
		public int addAdmin() {//添加用户/注册
			String sql = "insert into admin_pswd(userid,account,password) values(?,?,?)";
			String[] params = {userid,account,password};
			int result = con.update(sql, params);
			return result;
		}
		public int updateAdmin() {//修改账号密码
			int result = 0;
			String sql="update admin_pswd set account=?,password=? where userid=?";
			String[] params = { account,password,userid};
			result = con.update(sql, params);
			return result;
		}
		public Map getAdmin() { //查找某个用户账号密码
			Map user = null;
			String sql = "select * from admin_pswd where account=?";
			String[] params = {account};
			user = con.getMap(sql, params);
			return user;
		}
}
