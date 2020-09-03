package com.chi;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class FoodEdit
 */
@WebServlet("/FoodEdit")
public class FoodEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*
		 * 修改功能包括两个过程：
		 * 第一个过程：就是从数据库加载旧的数据到页面。就是先从列表页面点击修改按钮，然后开始请求修改的servlet，在servlet中查询数据库，把旧的数据查询重出来，然后传给修改页面的表单。
		 * 第二个过程：把修改后的表单数据传递到servlet,然后再保存到数据库。
		 * 
		 * 注意：修改数据的时候，一定要指明修改的id,是根据id来进行修改的，每次只修改一条数据。
		 * 凡是通过url地址栏的请求都是get请求。 
		 * request:接收前端传递过来的参数
		 * response：后端向前端响应数据。
		 * */
		//设置接收参数的编码
		request.setCharacterEncoding("utf-8");
		//接收参数id
		String id=request.getParameter("id");
		//定义sql语句，把原来旧的数据查询出来
		String strSql="select * from food where id=?";
		//定义参数对象并且把接收到的id附加到对象上。
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		//定义一个数据库操作类对象。
		DBHelper dal=new DBHelper();
		//使用数据库操作对象查询数据库，并且把查询的结果保存到objbyid对象中。
		Map<String, Object> objbyid =dal.getSingleObject(strSql, params);
		//把objbyid这个对象附加到request对象上
		request.setAttribute("objbyid", objbyid);
		//重定向到前端的jsp页面，并且把查询结果也传递过去。
		request.getRequestDispatcher("/admin/foodedit.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//设置接受参数的编码
		 request.setCharacterEncoding("utf-8"); 
		 
		 String j_id="";
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
                   if(name.equals("id"))
                   {
                   	j_id=item.getString("UTF-8");
                   }
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
		
		 if(imgpath.length()>0)
		 {
			 params.add(imgpath);
		 }
		 params.add(j_id);
		 
		 //构造sql查询语句 
		 String strSql=" update food set kind=?,cainame=?,price=?,brief=? where id=?";
		 if(imgpath.length()>0)
		 {
			 strSql=" update food set kind=?,cainame=?,price=?,brief=?,imgurl=? where id=?";
		 }
		 //DBHelper是一个数据库操作的公共类，类里面封装了执行sql命令的方法。以后凡是要操作数据库的地方都需要new一个这个类的对象，通过这个对象去执行sql命令。
		 DBHelper Dal=new DBHelper();
		 Dal.excuteSql(strSql, params);
		 
		 //告诉前端，后端已经把数据保存到了数据库
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
		 response.getWriter().write("<font color='green'>保存成功,0秒之后发生跳转到新增页面继续操作</font>");
		 //5秒之后跳转到添加页面
        response.setHeader("Refresh", "0;URL="+request.getContextPath()+"/FoodEdit?id="+j_id);
	}

}
