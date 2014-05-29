package Bean;

public class Page {
	int ID;
	int UserID;
	String Title;
	String Content;
	long SendTime;
	public Page(int id,int uid,String t,String c,long r)
	{
		ID=id; UserID=uid; Title=t; Content=c; SendTime=r;
	}
	public void SetPageID(int a)
	{
		ID=a;
	}
	public void SetUserID(int uid)
	{
		UserID=uid;
	}
	public void SetTitle(String t)
	{
		Title=t;
	}
	public void SetContent(String s)
	{
		Content=s;
	}
	public void SetSendTime(long a)
	{
		SendTime=a;
	}
	public int GetPageID()
	{
		return ID;
	}
	public int GetUserID()
	{
		return UserID;
	}
	public String GetTitle()
	{
		return Title;
	}
	public String GetContent()
	{
		return Content;
	}
	public long GetSendTime()
	{
		return SendTime;
	}
}
