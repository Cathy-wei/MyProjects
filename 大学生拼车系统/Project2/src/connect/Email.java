package connect;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class Email {  
    private String myEmailAccount = "2769801751@qq.com";//�������˺�
    private String myEmailPassword = "pxwdlyvwnhcydeia";//����
    private String myEmailSMTPHost = "smtp.qq.com";// ����������� SMTP ��������ַ
    private String receiveMail;// �ռ�������
    private String receiveName;//�ռ�������
    public String getReceiveMail() {
		return receiveMail;
	}
	public void setReceiveMail(String receiveMail) {
		this.receiveMail = receiveMail;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
    public void send() throws Exception{
        // 1. ������������, ���������ʼ��������Ĳ�������
        Properties props = new Properties();                    // ��������
        props.setProperty("mail.transport.protocol", "smtp");   // ʹ�õ�Э�飨JavaMail�淶Ҫ��
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // �����˵������ SMTP ��������ַ
        props.setProperty("mail.smtp.auth", "true");            // ��Ҫ������֤
        // 2. �������ô����Ự����, ���ں��ʼ�����������
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);                                 // ����Ϊdebugģʽ, ���Բ鿴��ϸ�ķ��� log
        // 3. ����һ���ʼ�
        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMail,receiveName);
        // 4. ���� Session ��ȡ�ʼ��������
        Transport transport = session.getTransport();

        // 5. ʹ�� �����˺� �� ���� �����ʼ�������, ������֤����������� message �еķ���������һ��, ���򱨴�
        transport.connect(myEmailAccount, myEmailPassword);
        // 6. �����ʼ�, �������е��ռ���ַ, message.getAllRecipients() ��ȡ�������ڴ����ʼ�����ʱ��ӵ������ռ���, ������, ������
        transport.sendMessage(message, message.getAllRecipients());

        // 7. �ر�����
        transport.close();
    }

    /**
     * ����һ��ֻ�����ı��ļ��ʼ�
     *
     * @param session �ͷ����������ĻỰ
     * @param sendMail ����������
     * @param receiveMail �ռ�������
     * @return
     * @throws Exception
     */
    public MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String receiveName) throws Exception {
        // 1. ����һ���ʼ�
        MimeMessage message = new MimeMessage(session);

        // 2. From: ������
        message.setFrom(new InternetAddress(sendMail, "��ѧ��ƴ��ϵͳ", "UTF-8"));

        // 3. To: �ռ��ˣ��������Ӷ���ռ��ˡ����͡����ͣ�
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, receiveName, "UTF-8"));

        // 4. Subject: �ʼ�����
        message.setSubject("ƴ���ɹ�", "UTF-8");

        // 5. Content: �ʼ����ģ�����ʹ��html��ǩ��
        message.setContent(receiveName+"������ƴ���ɹ����뼰ʱ��ϵ�����˽���ƴ��", "text/html;charset=UTF-8");

        // 6. ���÷���ʱ��
        message.setSentDate(new Date());

        // 7. ��������
        message.saveChanges();

        return message;
    }
	

}