	package com.chi;
	import java.lang.reflect.Field;
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
	public class DBHelper {
    private static final String DRIVER="com.mysql.jdbc.Driver";
    private static final String URL="jdbc:mysql://localhost:3306/eating";
    private static final String USER="root";
    private static final String PASSWORD="123456";
     
  
    public Connection getConnection(){
        Connection conn=null;
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            conn=DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return conn;
    }
     
  
    public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection conn){
        try {
            if(rs!=null){
                rs.close();
            }
            if(pstmt!=null){
                pstmt.close();
            }
            if(conn!=null){
                conn.close();
            }
        } catch (SQLException e) {
           
            e.printStackTrace();
        }
    }
     
  
    public boolean excuteSql(String sql,List<Object> params){
        int res=0;
        Connection conn=null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try {
            conn=getConnection();
            pstmt=conn.prepareStatement(sql);
            if(params!=null){
                
                for(int i=0;i<params.size();i++){
                    pstmt.setObject(i+1, params.get(i));
                }
            }
            res=pstmt.executeUpdate();
             
        } catch (SQLException e) {
           
            e.printStackTrace();
        }finally{
            closeAll(rs, pstmt, conn);
        }
        return res>0?true:false;
    }
    
  
    public List<Map<String, Object>> executeQuery(String sql, List<Object> params) throws SQLException{
    	Connection conn=null;
    	PreparedStatement pstmt = null;
    	ResultSet rs=null;
    	conn=getConnection();
        pstmt=conn.prepareStatement(sql);
    	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		int index = 1;
		pstmt = conn.prepareStatement(sql);
		if(params != null && !params.isEmpty()){
			for(int i = 0; i<params.size(); i++){
				pstmt.setObject(index++, params.get(i));
			}
		}
		rs = pstmt.executeQuery();
		ResultSetMetaData metaData = rs.getMetaData();
		int cols_len = metaData.getColumnCount();
		while(rs.next()){
			Map<String, Object> map = new HashMap<String, Object>();
			for(int i=0; i<cols_len; i++){
				String cols_name = metaData.getColumnName(i+1);
				Object cols_value = rs.getObject(cols_name);
				if(cols_value == null){
					cols_value = "";
				}
				map.put(cols_name, cols_value);
			}
			list.add(map);
		}
		return list;
	}
    

    public Map<String,Object> getSingleObject(String sql,List<Object> params){
        Map<String,Object> map = new HashMap<String,Object>();
        Connection conn=null;
    	PreparedStatement pstmt = null;
    	ResultSet rs=null;
    	conn=getConnection();
        try {
        	pstmt=conn.prepareStatement(sql);
            
        	int index = 1;
        	if(params != null && !params.isEmpty()){
    			for(int i = 0; i<params.size(); i++){
    				pstmt.setObject(index++, params.get(i));
    			}
    		}
            rs = pstmt.executeQuery();
          
            ResultSetMetaData metaData = rs.getMetaData();
    		int cols_len = metaData.getColumnCount();
    		while(rs.next()){
    			for(int i=0; i<cols_len; i++){
    				String cols_name = metaData.getColumnName(i+1);
    				Object cols_value = rs.getObject(cols_name);
    				if(cols_value == null){
    					cols_value = "";
    				}
    				map.put(cols_name, cols_value);
    			}
    		}
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
       
            closeAll(rs,pstmt,conn);
        }
        return map;
    }
    
    
     
    
    public <T> List<T> executeQuery(String sql,List<Object> params,Class<T> cls) throws Exception{
        Connection conn=null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        List<T> data=new ArrayList<T>();
        try {
            conn=getConnection();
            pstmt=conn.prepareStatement(sql);
            if(params!=null){
               
                for(int i=0;i<params.size();i++){
                    pstmt.setObject(i+1, params.get(i));
                }
            }
            rs=pstmt.executeQuery();
           
            ResultSetMetaData rsd=rs.getMetaData();
            while(rs.next()){
                T m=cls.newInstance();
                for(int i=0;i<rsd.getColumnCount();i++){
                    String col_name=rsd.getColumnName(i+1);
                    Object value=rs.getObject(col_name);
                    Field field=cls.getDeclaredField(col_name);
                    field.setAccessible(true);
                    field.set(m, value);
                 }
                data.add(m);
            }
             
        } catch (SQLException e) {
            
            e.printStackTrace();
        }finally{
            closeAll(rs, pstmt, conn);
        }
        return data;
    }
}