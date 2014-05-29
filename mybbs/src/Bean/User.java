package Bean;

public class User {
	int ID;
	String UserID;
	String Password;
	String Name;
	String Image;
	boolean Sex;
	long Adddate;
	long Lastlogindate;
	int LoginCount;
	public User()
	{
		
	}
	public User(int id,String uid,String Pass,String n,String im,boolean sex,long date,long ldate,int count)
	{
		ID=id;
		UserID=uid;
		Password=Pass;
		Name=n;
		Image=im;
		Sex=sex;
		Adddate=date;
		Lastlogindate=ldate;
		LoginCount=count;
	}
	public void SetID(int a)
	{
		ID=a;
	}
	public void SetUserID(String a)
	{
		UserID=a;
	}
	public void SetPassword(String a)
	{
		Password=a;
	}
	public void SetName(String a)
	{
		Name=a;
	}
	public void SetImage(String a)
	{
		Image=a;
	}
	public void SetSex(boolean a)
	{
		Sex=a;
	}
	public void SetAdddate(long a)
	{
		Adddate=a;
	}
	public void SetLastlogindate(long a)
	{
		Lastlogindate=a;
	}
	public void SetLoginCount(int a)
	{
		LoginCount=a;
	}
	public int GetID()
	{
		return ID;
	}
	public int GetLoginCount()
	{
		return LoginCount;
	}
	public String GetUserID()
	{
		return UserID;
	}
	public String GetPass()
	{
		return Password;
	}
	public String GetName()
	{
		return Name;
	}
	public String GetImage()
	{
		return Image;
	}
	public boolean GetSex()
	{
		return Sex;
	}
	public long GetAdddate()
	{
		return Adddate;
	}
	public long GetLastlogindate()
	{
		return Lastlogindate;
	}
}
