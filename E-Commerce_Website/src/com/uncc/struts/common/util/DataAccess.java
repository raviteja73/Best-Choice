package com.uncc.struts.common.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.uncc.struts.common.util.DBConnection;

public class DataAccess {
	
	

	public static ArrayList pickData(String query) throws Exception
	 {
		  Connection lcon=null;
		 
		  Statement lstmt=null;
		   
		  ResultSet lrs=null;
		    
		  
		  
		    
		  ArrayList DataList=new ArrayList();
		  try
		    {
			 
			  lcon = DBConnection.getDBConnection();
		      
			  
		      lstmt = lcon.createStatement(); 
		      
		      System.out.println("Query:"+query);
		      
		      lrs = lstmt.executeQuery(query);   
		      
		      ResultSetMetaData rsMetaData=lrs.getMetaData();
		      
		      int columnCount=rsMetaData.getColumnCount();
		     
		      while(lrs.next())
		          {
		              ArrayList alist=new ArrayList();
		              
		             
		              
		              for(int loopCount=1;loopCount<=columnCount;loopCount++)
		              {
		            	System.out.println("ColumnValue:"+  lrs.getString(loopCount));
		                if(lrs.getString(loopCount)!=null)                
		                {
		                	System.out.println("Data in Main :"+lrs.getString(loopCount));
		                    alist.add(lrs.getString(loopCount));
		                }
		               else
		                {
		                  alist.add("0");
		                  System.out.println("In Varcharcommma");
		                }
		               
		              
		              }   
		            
		              DataList.add(alist);
		              //System.out.println("DataList>>>>>"+DataList);
		           }
		           if(lrs!=null)
		           {
		              DBConnection.closeResultSet(lrs);
		              lrs=null;
		           }
		           if(lstmt!=null)
		           {
		               DBConnection.closeStatement(lstmt);
		               lstmt=null;
		           }
		           if(lcon!=null)
		           {
		                DBConnection.closeConnection(lcon);
		                lcon=null;
		           }
		           
		      }    
		      catch(SQLException sqle)
		     {
		         throw sqle;
		      }
		     catch(Exception lexp)
		     {
		          throw lexp;
		     }
		     finally
		      {
		         if(lrs!=null)
		         {
		           DBConnection.closeResultSet(lrs);
		            lrs=null;
		         }
		         if(lstmt!=null)
		         {
		             DBConnection.closeStatement(lstmt);
		             lstmt=null;
		         }
		         if(lcon!=null)
		         {
		             DBConnection.closeConnection(lcon);
		             lcon=null;         
		         }
		       }
		                  
		        return DataList;
		   
		 }

	public static int insertData(String Query) throws Exception
	{
		Connection lcon=null;
		 
		  Statement lstmt=null;
		   
		  ResultSet lrs=null;
		  int rowsInserted=0;
		  
		  try{
		  lcon = DBConnection.getDBConnection();
		  
		  lstmt = lcon.createStatement(); 
		  
		 rowsInserted= lstmt.executeUpdate(Query);
		  }
		  
		  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		  finally
		  {
			  try {
				lcon.close();
			
				lstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  }
		return rowsInserted;
	}

}
