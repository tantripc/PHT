using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for VietnameseConvert
/// </summary>
public class VietnameseConvert
{
	public VietnameseConvert()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    const string FindText="áàảãạâấầẩẫậăắằẳẵặđéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵÁÀẢÃẠÂẤẦẨẪẬĂẮẰẲẴẶĐÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴ";  
    const string ReplText="aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAADEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYY";
    public string ChuyenTVKhongDau(string strVietNamese)  
    {  
        int index=-1;  
        while ((index = strVietNamese.IndexOfAny(FindText.ToCharArray())) != -1)  
        {  
            int index2 = FindText.IndexOf(strVietNamese[index]);  
            strVietNamese = strVietNamese.Replace(strVietNamese[index], ReplText[index2]);  
        }  
        return strVietNamese;  
    }
}
