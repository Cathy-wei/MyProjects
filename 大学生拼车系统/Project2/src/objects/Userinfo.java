package objects;

import java.util.List;
import java.util.Map;

import connect.Connect;

public class Userinfo {
	private String userid;
	private String username;
	private String tel;
	private String email;
	private String wechat;
	private String school;
	private Connect con;
	public Userinfo() {
		con = new Connect();
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWechat() {
		return wechat;
	}
	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}

	//===========用户=========
	/*public List getAllUserInfo() {//获取所有用户信息
		List users = null;
		String sql = "select * from userinfo";
		users = con.getList(sql, null);
		return users;
	}*/
	public Map getUserInfo() { //查找某用户信息
		Map user = null;
		String sql = "select * from userinfo where userid=?";
		String[] params = {userid};
		user = con.getMap(sql, params);
		return user;
	}
	public int addUser() {//添加用户
		String sql = "insert into userinfo(userid,username,tel,email,wechat,school) values(?,?,?,?,?,?)";
		String[] params = {userid,username,tel,email,wechat,school};
		int result = con.update(sql, params);
		return result;
	}
	public int updateUser() {//修改某用户信息
		int result = 0;
		String sql="update userinfo set username=?,tel=?,email=?,wechat=?,school=? where userid=?";
		String[] params = { username,tel,email,wechat,school,userid};
		result = con.update(sql, params);
		return result;
	}
	//===========管理员=========
	public Map getAdminInfo() { //查找某管理员信息
		Map user = null;
		String sql = "select * from admininfo where userid=?";
		//System.out.print("12312");
		String[] params = {userid};
		user = con.getMap(sql, params);
		return user;
	}
	public int updateAdmin() {//修改某管理员信息
		int result = 0;
		String sql="update admininfo set username=?,tel=?,email=?,wechat=? where userid=?";
		String[] params = { username,tel,email,wechat,userid};
		result = con.update(sql, params);
		return result;
	}
}
