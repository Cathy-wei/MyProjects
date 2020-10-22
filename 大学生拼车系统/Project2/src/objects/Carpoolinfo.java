package objects;

import java.util.List;
import java.util.Map;

import connect.Connect;
public class Carpoolinfo {
	private String carid;//ƴ����
	private String userid;//������id
	private String sendtime;//����ʱ��
	private String departuretime; //����ʱ��
	private String departureplace; //�����ص�
	private String destination; //����ص�
	private String targetnum; //Ŀ������
	private String 	currentnum; //��ǰ����
	private String state1;//״̬1:�ҷ����/�Ҽ����
	private String state2;//״̬2:ƴ����/ƴ���ɹ�/ƴ��ʧ��
	private Connect con;
	public Carpoolinfo(){
		con = new Connect();
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCarid() {
		return carid;
	}
	public void setCarid(String carid) {
		this.carid = carid;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getDeparturetime() {
		return departuretime;
	}
	public void setDeparturetime(String departuretime) {
		this.departuretime = departuretime;
	}
	public String getDepartureplace() {
		return departureplace;
	}
	public void setDepartureplace(String departureplace) {
		this.departureplace = departureplace;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getTargetnum() {
		return targetnum;
	}
	public void setTargetnum(String targetnum) {
		this.targetnum = targetnum;
	}
	public String getCurrentnum() {
		return currentnum;
	}
	public void setCurrentnum(String currentnum) {
		this.currentnum = currentnum;
	}
	public String getState1() {
		return state2;
	}
	public void setState1(String state1) {
		this.state1 = state1;
	}
	public String getState2() {
		return state2;
	}
	public void setState2(String state2) {
		this.state2 = state2;
	}
	
	public int addCarpool() {//����û�/ע��
		String sql = "insert into carpoolinfo(userid,sendtime,departuretime,departureplace,destination,targetnum,currentnum) values(?,?,?,?,?,?,?)";
		String[] params = {userid,sendtime,departuretime,departureplace,destination,targetnum,currentnum};
		int result = con.update(sql, params);
		return result;
	}
	public List getAllcarpools() {
		List cars=null;
		String sql = "select * from carpoolinfo";
		cars=con.getList(sql, null);
		return cars;
	}
	public List getAllCarpool(String state1,String state2) {//��ȡ����ƴ����Ϣ
		List carpools = null;
		String sql = "select *  from carpoolinfo as c,userinfo as u,usercarpool as uc WHERE c.carid=uc.carid and c.userid=u.userid and state1=? and state2=?";
		String[] params = {state1,state2};
//		System.out.print("as");
		carpools = con.getList(sql, params);
		return carpools;
	}
	public List getCarpools(String userid,String state1) {//��ȡĳ�û�����ƴ����Ϣ
		List carpools = null;
		String sql = "select *  from carpoolinfo as c,userinfo as u,usercarpool as uc WHERE c.carid=uc.carid and c.userid=u.userid and uc.userid=? and state1=?";
		String[] params = {userid,state1}; 
		carpools = con.getList(sql, params);
		return carpools;
	}
	public Map getCarpool() {
		Map carpool = null;
		String sql = "select * from carpoolinfo where carid=?";
		String[] params = {carid};
		carpool = con.getMap(sql, params);
		return carpool;
	}
	public List getCarpool_p() {//���ݵص��ѯƴ����Ϣ
		List place = null;
		String sql = "SELECT * FROM carpoolinfo as c , userinfo as u,usercarpool as uc WHERE c.userid=u.userid and departureplace REGEXP ? and destination REGEXP ? and c.carid=uc.carid";
		String[] params = {departureplace,destination};
		place = con.getList(sql, params);
		return place;
	}
	public List getCarpool_t(String t1,String t2) { //��ʱ�������Ϣ
		List place = null;
		String sql = "select * from carpoolinfo as c ,userinfo as u,usercarpool as uc  where c.userid=u.userid and sendtime between ? AND ?  and c.carid=uc.carid";
		String[] params = {t1,t2};
		place = con.getList(sql, params);
		return place;
	}
	public int updateCarpool() {//�޸�ĳƴ����Ϣ
		int result = 0;
		String sql="update carpoolinfo set sendtime=?,departuretime=?,departureplace=?,destination=?,targetnum=?,currentnum=? where carid=?";
		String[] params = { sendtime,departuretime,departureplace,destination,targetnum,currentnum,carid};
		result = con.update(sql, params);
		return result;
	}
	public int updateCurrentadd() {//��ǰ������һ
		int result = 0;
		String sql="update carpoolinfo set currentnum=currentnum+1 where carid=?";
		String[] params = {carid};
		result = con.update(sql, params);
		return result;
	}
	public int updateCurrentsub() {//��ǰ������һ
		int result = 0;
		String sql="update carpoolinfo set currentnum=currentnum-1 where carid=?";
		String[] params = {carid};
		result = con.update(sql, params);
		return result;
	}
	//=================userCarpool================
	public int addUsercarpool() {//����û�ƴ����====���ҷ����/�Ҽ����
		String sql = "insert into usercarpool(carid,userid,state1,state2) values(?,?,?,?)";
		String[] params = {carid,userid,state1,state2};
		int result = con.update(sql, params);
		return result;
	}
	public int updateState() {//�޸��û�ƴ��״̬2
		int result = 0;
		String sql="update usercarpool set state2=? where carid=? ";
		//�Ƚ�ʱ��
		String[] params = { state2,carid};
		result = con.update(sql, params);
		return result;
	}
	public int updateState2() {//�޸��û�ƴ��״̬2
		int result = 0;
		String sql="update usercarpool set state2=? where carid=? and userid=?";
		//�Ƚ�ʱ��
		String[] params = { state2,carid,userid};
		result = con.update(sql, params);
		return result;
	}
	public int updateState1() {//�޸��û�ƴ��״̬1
		int result = 0;
		String sql="update usercarpool set state1=? where carid=? and userid=?";
		String[] params = { state1,carid,userid};
		result = con.update(sql, params);
		return result;
	}
	public List getUsercarpool() {
		List uc = null;
		String sql = "select * from usercarpool where carid=?";
		String[] params = {carid};
		uc = con.getList(sql, params);
		return uc;
	}
	public List getUserState() {
		List uc = null;
		String sql = "select * from usercarpool where carid=? and userid=?";
		String[] params = {carid,userid};
		uc = con.getList(sql, params);
		return uc;
	}
	public List getAllsuccess() {
		List l=null;
		String sql="select *  from usercarpool as uc , userinfo as u where u.userid=uc.userid and carid=? and state2=\"ƴ���ɹ�\" ";
		String[] params = {carid};
		l=con.getList(sql, params);
		return l;
	}
	

}
