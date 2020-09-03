package com.chi;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.chi.DBHelper;


/**
 * Servlet implementation class FoodAdd
 */
@WebServlet("/FoodAdd")
public class FoodAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//设置接受参数的编码
		 request.setCharacterEncoding("utf-8"); 
		 
		 String j_kind="";
		 String j_cainame=""; 
		 String j_price=""; 
		 String j_brief="";  
		 String imgpath="";
		  
		//上传文件 把文件上传到指定的目录
		 //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
       String savePath = this.getServletContext().getRealPath("/upload");
       File file = new File(savePath);
       //判断上传文件的保存目录是否存在
       if (!file.exists() && !file.isDirectory()) {
           System.out.println(savePath+"目录不存在，需要创建");
           //创建目录
           file.mkdir();
       }
       //消息提示
       String message = "";
       try{
           //使用Apache文件上传组件处理文件上传步骤：
           //1、创建一个DiskFileItemFactory工厂
           DiskFileItemFactory factory = new DiskFileItemFactory();
           //2、创建一个文件上传解析器
           ServletFileUpload upload = new ServletFileUpload(factory);
            //解决上传文件名的中文乱码
           upload.setHeaderEncoding("UTF-8"); 
           //3、判断提交上来的数据是否是上传表单的数据
           if(!ServletFileUpload.isMultipartContent(request)){
               //按照传统方式获取数据
               return;
           }
           //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
           List<FileItem> list = upload.parseRequest(request);
           for(FileItem item : list){
           	
               //如果fileitem中封装的是普通输入项的数据
               if(item.isFormField()){
                   String name = item.getFieldName();
                   //解决普通输入项的数据的中文乱码问题
                   
                   if(name.equals("kind"))
                   {
                	j_kind=item.getString("UTF-8");
                   }
                   if(name.equals("cainame"))
                   {
                   	j_cainame=item.getString("UTF-8");
                   }
                   if(name.equals("price"))
                   {
                	j_price=item.getString("UTF-8");
                   }
                   if(name.equals("brief"))
                   {
                	j_brief=item.getString("UTF-8");
                   }
                  
                   
               }else{//如果fileitem中封装的是上传文件
                   //得到上传的文件名称，
                   String filename = item.getName();
                   System.out.println(filename);
                   if(filename==null || filename.trim().equals("")){
                       continue;
                   }
                   //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\111.png，而有些只是单纯的文件名，如：1.txt
                   //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                   String namestr= new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
                   
                   filename =namestr+filename.substring(filename.lastIndexOf("."));
                   imgpath=filename;
                   //获取item中的上传文件的输入流
                   InputStream in = item.getInputStream();
                   //创建一个文件输出流
                   FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
                   //创建一个缓冲区
                   byte buffer[] = new byte[1024];
                   //判断输入流中的数据是否已经读完的标识
                   int len = 0;
                   //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                   while((len=in.read(buffer))>0){
                       //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                       out.write(buffer, 0, len);
                   }
                   //关闭输入流
                   in.close();
                   //关闭输出流
                   out.close();
                   //删除处理文件上传时生成的临时文件
                   item.delete();
               }
           }
       }catch (Exception e) {
           message= "文件上传失败！";
           e.printStackTrace();
           
       }
		 
		 
		 //构造一个参数对象，把要添加的数据都放到这个对象上。
		 List<Object> params = new ArrayList<Object>();
		 
		 params.add(j_kind);
		 params.add(j_cainame);
		 params.add(j_price);
		 params.add(j_brief);
		 params.add(imgpath);
		 
		 //构造sql查询语句  该语句的功能是向数据库插入一条新闻 用问号占位
		 String strSql="insert into food (kind,cainame,price,brief,imgurl) values (?,?,?,?,?)";
		 
		 //DBHelper是一个数据库操作的公共类，类里面封装了执行sql命令的方法。以后凡是要操作数据库的地方都需要new一个这个类的对象，通过这个对象去执行sql命令。
		 DBHelper Dal=new DBHelper();
		 Dal.excuteSql(strSql, params);
		 
		 //告诉前端，后端已经把数据保存到了数据库
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
		 response.getWriter().write("<font color='green'>保存成功,0秒之后发生跳转到新增页面继续发布</font>");
		 //5秒之后跳转到添加页面
        response.setHeader("Refresh", "0;URL="+request.getContextPath()+"/admin/foodadd.jsp");


		
		
	}

}
