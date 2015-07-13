using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Authentication;
using System.Security.Cryptography;

/// <summary>
/// Summary description for MyCode
/// </summary>
public class MyCode
{
	public MyCode()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    // Ma hoa MD6 cho password
    public string encryptString(string inputString)
    {
        MD5 x = new MD5CryptoServiceProvider();
        byte[] lam = Encoding.UTF8.GetBytes(inputString);
        lam = x.ComputeHash(lam);
        StringBuilder s = new StringBuilder();
        foreach (byte b in lam)
        {
            s.Append(b.ToString("x2").ToLower());
        }

        // Ma hoa lan 2
        MD5 x1 = new MD5CryptoServiceProvider();
        byte[] lam1 = Encoding.UTF8.GetBytes(s.ToString());
        lam1 = x1.ComputeHash(lam1);
        StringBuilder s1 = new StringBuilder();
        foreach (byte b1 in lam1)
        {
            s1.Append(b1.ToString("x2").ToLower());
        }

        return s1.ToString();
    }
}