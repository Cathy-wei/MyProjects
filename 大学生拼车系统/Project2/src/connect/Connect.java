package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Connect {
	private String driver;
	private String url;
	private String username;
	private String password;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Connect() {
		driver = "com.mysql.cj.jdbc.Driver";
		url = "jdbc:mysql://localhost:3306/cars?useSSL=false&serverTimezone=UTC";
		username = "root";
		password = "123456";
	}

	private Connection getConnection() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e1) {
			// TODO �Զ����ɵ� catch ��
			e1.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		return con;
	}
	private PreparedStatement getPreparedStatement(String sql) {
		try {
			ps = getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		return ps;
	}
	private void setParams(String sql,String[] params) {//��sql�������������
		ps = this.getPreparedStatement(sql);
		if(params!=null) {
      		for(int i=0;i<params.length;i++) {
				try {
					ps.setString(i+1, params[i]);
					
				} catch (SQLException e) {
					// TODO �Զ����ɵ� catch ��
					e.printStackTrace();
				}
			}
		}
	}
	public List getList(String sql,String[] params) {
		List list = new ArrayList();
		
		try {
			this.setParams(sql, params);
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()) {
				Map m =new HashMap();
				for(int i=1;i<=rsmd.getColumnCount();i++) {
					String colName = rsmd.getColumnName(i);
					m.put(colName, rs.getString(colName));
				}
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}finally {
			close(); 
		}
		return list;
	}
	public Map getMap(String sql,String[]params) {
		List list = getList(sql,params);
		if(list.isEmpty())
			return null;
		else
			return (Map)list.get(0);
	}
	
	public int update(String sql,String[] params) {
		int result=0;//��Ӱ������
		try{
			setParams(sql,params);
			result = ps.executeUpdate();
//		  	System.out.print("ssss");
		}catch(Exception e) {
			e.printStackTrace();
		}
	 	close();
		return result;
	}
	private void close() {
		// TODO �Զ����ɵķ������
		
			try {
				if(rs!=null)
				rs.close();
				if(ps!=null)
				ps.close();
				if(con!=null)
				con.close();
			} catch (SQLException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
	}
}
