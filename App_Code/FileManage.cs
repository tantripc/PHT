using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FileManage
/// </summary>
public class FileManage
{
	public FileManage(string name, string file)
	{
        this.name = name;
        this.file = file;
	}
    string name;
    public string GetName()
    {
        return this.name;
    }
    string file;
    public string GetFile()
    {
        return this.file;
    }
}
