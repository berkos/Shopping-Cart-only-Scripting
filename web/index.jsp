<%-- 
    Document   : index
    Created on : 8 Δεκ 2011, 11:11:46 πμ
    Author     : BerkosDesk
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jdom.input.SAXBuilder,org.jdom.Document,org.jdom.Element,org.jdom.JDOMException"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*"
%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="grafika2.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart by Antonis</title>
        
        
        <script type="text/javascript">
/*function loadXMLDoc()
{
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("get","index2.jsp",true);
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.send("fname=Henry&lname=Ford");
}*/
                         
                         
                          <%! Element  node1,node2,node3 ; Double CafeP,CafeV,SugarP; 
                                  Double SugarV=0.0,WaterV=0.0,WaterP=0.0 ; double sum ,sumWater,sumCafe,sumSugar;
               boolean flag=false; DecimalFormat df = new DecimalFormat("#.##");
                    
                    
            %>
                         
</script>



 <%
  
         SAXBuilder builder = new SAXBuilder();
	  File xmlFile = new File("C:/Users/BerkosDesk/Documents/NetBeansProjects/project33/Basket.xml");
  
          try {
 
		Document document = (Document) builder.build(xmlFile);
		Element rootNode = document.getRootElement();
		List list = rootNode.getChildren("ITEM");
 
                node1 = (Element) list.get(0);
                node2 = (Element) list.get(1);
                node3 = (Element) list.get(2);
		
                for (int i = 0; i < list.size(); i++) {
 
		   Element node = (Element) list.get(i);
 
		   System.out.println("Product : " + node.getChildText("name"));
		   System.out.println("Cafe: " + node.getChildText("Price"));

 
		}
 
	  } catch (IOException io) {
		System.out.println(io.getMessage());
	  } catch (JDOMException jdomex) {
		System.out.println(jdomex.getMessage());
	  }
          
          
          
%>






 <%
                   
                   Cookie[] cookies = request.getCookies();
                   
                   if ( cookies != null ) {
                       flag=true;
                    for (int i = 0; i < cookies.length; i++) {
                        Cookie cookie = cookies[i];
                        if (cookie.getName().equals("Cafe")) {
                            String userName = cookie.getValue();
                                       System.out.println("Cafe"  + userName);
                                        CafeV=new Double(userName);
                         }
                        if (cookie.getName().equals("Sugar")) {
                            String userName = cookie.getValue();
                                       System.out.println("Sugar"  + userName);
                                        SugarV=new Double(userName);
                         }
                        if (cookie.getName().equals("Water")) {
                            String userName = cookie.getValue();
                                       System.out.println("Water"  + userName);
                                        WaterV=new Double(userName);
                         }
                        }
                       
                       CafeP = new Double(node1.getChildText("Price"));
                        SugarP = new Double(node2.getChildText("Price") );
                         WaterP = new Double(node3.getChildText("Price") );
                        //  CafeV=0.0;
                        //  SugarV=0.0;
                        //    WaterV=0.0;
                         sumWater=WaterV*WaterP;
                          sumCafe=CafeP*CafeV;
                         sumSugar=SugarP*SugarV;
                                      
			sum=  sumWater +sumCafe + sumSugar;
                                      
                         
                    }
                   else{
                            flag=false;
                            CafeV=new Double(0.0);
                            SugarV=new Double(0.0);
                            WaterV=new Double(0.0);
                        }
                   
          
      
			if(request.getParameter("CafeP") != null){
				if(request.getParameter("CafeP").equals(""))
					out.println("<html><font color=red>Please enter your name.</font></html>");
                                else{
                                      CafeP = new Double(request.getParameter("CafeP").toString() );
                                     CafeV = new Double(request.getParameter("CafeV").toString() );
                                      SugarV = new Double(request.getParameter("SugarV").toString() );
                                        SugarP = new Double(request.getParameter("SugarP").toString() );
                                       WaterP = new Double(request.getParameter("WaterP").toString() );
                                      WaterV = new Double(request.getParameter("WaterV").toString() );
                                        flag=true;
                                      sumWater=WaterV*WaterP;
                                      sumCafe=CafeP*CafeV;
                                      sumSugar=SugarP*SugarV;
                                      
					 sum=  sumWater +sumCafe + sumSugar;
                                      
                                         
                                  
                                  }
			}
                       else{
                       
                                      
                           }
                           
         %>

    </head>
    <body>
        
        
        
        
        
       
 
        <h1>Shopping Cart by Antonis</h1>
        
        <form method="get">
                <table cellpadding="3">
<tbody>
<tr>
<td align="LEFT"><strong>Item</strong></td>
<td align="RIGHT"><strong>Price</strong></td>
<td align="RIGHT"><strong>Quantity</strong></td>
<td align="RIGHT"><strong>Current Quantity</strong></td>
<td align="RIGHT"><strong>Total</strong></td>
</tr>
<tr>
<td align="LEFT"><%=node1.getChildText("name")%></td>
<td align="RIGHT">$ <%=node1.getChildText("Price")%></td>
<td><input type="text" name="CafeV" 
           value="<%if (flag)out.print(CafeV); else out.print("0.0");  %>" size="5" style:="visibility: visible" /></td>
<td align="RIGHT"> <%if (flag)out.print(CafeV); else out.print("0.0");  %></td>
<td align="RIGHT">$ <%if (flag)out.print(df.format(sumCafe)); else out.print("0.0");  %></td>
</tr>
<tr>
<td align="LEFT"><%=node2.getChildText("name")%></td>
<td align="RIGHT">$ <%=node2.getChildText("Price")%></td>
<td><input type="text" name="SugarV" 
                 value="<%if (flag)out.print(SugarV); else out.print("0.0");  %>" size="5" style:="visibility: visible" /></td>
<td align="RIGHT"> <%if (flag)out.print(SugarV); else out.print("0.0");  %></td>
<td align="RIGHT">$ <%if (flag)out.print(df.format(sumSugar)); else out.print("0.0");  %></td>
</tr>
<tr>
<td align="LEFT"><%=node3.getChildText("name")%></td>
<td align="RIGHT">$ <%=node3.getChildText("Price")%></td>
<td><input type="text" name="WaterV" 
                       value="<%if (flag)out.print(WaterV); else out.print("0.0");  %>" size="5" style:="visibility: visible" /></td>
<td align="RIGHT"> <%if (flag)out.print(WaterV); else out.print(0.0);  %></td>
<td align="RIGHT">$ <%if (flag)out.print(df.format(sumWater)); else out.print(0.0);  %></td>
</tr>
<tr>
<td align="LEFT">Total</td>
<td align="RIGHT"></td>
<td align="RIGHT"></td>
<td align="RIGHT"> <% if (flag) out.println("Ποσόν $" +df.format(sum));  %></td>
</tr>
</tbody>
</table>
     <div>

           <input type="hidden" name="CafeP" value="<%=node1.getChildText("Price")%>"/>
             <input type="hidden" name="SugarP" value="<%=node2.getChildText("Price")%>"/>
               <input type="hidden" name="WaterP" value="<%=node3.getChildText("Price")%>"/>
                 <input type="submit" value="Ανανεωση"  />
                <input type="submit" value="Πληρωμη!"  />
            </div> 
                
                
        </form>      

     
<p></p>
<INPUT TYPE="BUTTON" VALUE="SRC" ONCLICK="window.location.href='http://dl.dropbox.com/u/12925667/Project3-scripting-WWW-Berkakis.rar'" >  
<INPUT TYPE="BUTTON" VALUE="?" ONCLICK="window.location.href='doc1.html' ">  
                
        <%
            if(flag){
                Cookie cookie=new Cookie("Cafe",CafeV.toString());
                cookie.setMaxAge(30*60);
                response.addCookie(cookie);
                Cookie cookie1=new Cookie("Sugar",SugarV.toString());
                cookie1.setMaxAge(30*60);
                response.addCookie(cookie1);
                Cookie cookie2=new Cookie("Water",WaterV.toString());
                cookie2.setMaxAge(30*60);
                response.addCookie(cookie2);
            }
         %> 
               
 
    </body>
</html>
