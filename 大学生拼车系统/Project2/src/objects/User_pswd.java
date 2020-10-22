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
	//=================�û�================
//	public Map getCount() {
//		Map count=null;
//		String sql="select  count(1) count from user_pswd";
//		count = con.getMap(sql, null);
//		return count;
//	}
	public int addUser() {//����û�/ע��
		String sql = "insert into user_pswd(account,password) values(?,?)";
		String[] params = {account,password};
		int result = con.update(sql, params);
		return result;
	}
	public int updateUser() {//�޸��˺�����
		int result = 0;
		String sql="update user_pswd set password=? where userid=?";
		String[] params = {password,userid};
		result = con.update(sql, params);
		return result;
	}
	public Map getUser(String userid) { //����ĳ���û��˺�����
		Map user = null;
		String sql = "select * from user_pswd where userid=?";
		String[] params = {userid};
		user = con.getMap(sql, params);
		return user;
	}
	public Map getUser() { //����ĳ���û��˺�����
		Map user = null;
		String sql = "select * from user_pswd where account=?";
		String[] params = {account};
		user = con.getMap(sql, params);
		return user;
	}
	//=================����Ա================
		public int addAdmin() {//����û�/ע��
			String sql = "insert into admin_pswd(userid,account,password) values(?,?,?)";
			String[] params = {userid,account,password};
			int result = con.update(sql, params);
			return result;
		}
		public int updateAdmin() {//�޸��˺�����
			int result = 0;
			String sql="update admin_pswd set account=?,password=? where userid=?";
			String[] params = { account,password,userid};
			result = con.update(sql, params);
			return result;
		}
		public Map getAdmin() { //����ĳ���û��˺�����
			Map user = null;
			String sql = "select * from admin_pswd where account=?";
			String[] params = {account};
			user = con.getMap(sql, params);
			return user;
		}
}
