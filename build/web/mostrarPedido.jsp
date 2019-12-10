<%@page import="java.util.Date"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.List"%>
    <%@page import="controlador.Bd"%>
        <%@page import="java.text.SimpleDateFormat"%>
            <%@page import="modelo.Usuario"%>
                <%@page contentType="text/html" pageEncoding="UTF-8"%>
                    <%HttpSession sesion = request.getSession();
if(sesion.getAttribute("usuario")== null){
ServletContext contexto = getServletContext();
RequestDispatcher rd = contexto.getRequestDispatcher("/index.html");
rd.forward(request, response);
}
Usuario usuario = (Usuario)sesion.getAttribute("usuario");
String nombre = usuario.getNombre();
Date fecha = new Date();
SimpleDateFormat formateador1= new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat formateador2= new SimpleDateFormat("kk:mm:ss");
String fechaF = formateador1.format(fecha);
String hora = formateador2.format(fecha);
Bd bd = new Bd();
bd.abrirConexion();

%>
                        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                        <html xmlns="http://www.w3.org/1999/xhtml">

                        <head>
                            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                            <title>Documento sin tÃÂ­tulo</title>

                            </style>
                            <style type="text/css">
                                .inicio {
                                    text-align: right;
                                    font-weight: bold;
                                }
                                
                                .centro {
                                    text-align: left;
                                }
                                
                                select {
                                    height: 7vh;
                                }
                                .medio{
                                    width: 40%;
                                    display: inline-block;
                                    font-size: 2em;
                                }
                                .entero{
                                    width: 100%;
                                }
                            </style>
                        </head>

                        <body>

                            <table width="100%" border="0">
                                <tr bordercolor="#FF0000" bgcolor="#FF0000">
                                    <td width="4%" bgcolor="#FFFFFF">&nbsp;</td>
                                    <td colspan="3" class="inicio"><a href="ofertas.jsp">Inicio </a></td>
                                    <td width="7%" bgcolor="#FFFFFF">&nbsp;</td>
                                </tr>
                                <tr bordercolor="#FF0000" bgcolor="#FF0000">
                                    <td width="4%" bgcolor="#FFFFFF">&nbsp;</td>
                                    <td colspan="3"><img src="images/images_2016/logo_telepizza.gif" />
                                        <br />
                                        <a href="ofertas.jsp"><img src="images/images_2016/ofertas.gif" width="73" height="31" longdesc="http://ofertas.jsp" /></a>
                                        <a href="menu.jsp"><img src="images/images_2016/menus.gif" width="66" height="31" longdesc="http://ASD" /></a>
                                        <a href="pizza.jsp"><img src="images/images_2016/pizzas.gif" width="66" height="31" longdesc="http://SDFG" /></a>
                                        <a href="entrante.jsp"><img src="images/images_2016/entrantes.gif" width="85" height="31" longdesc="http://DFGSD" /></a>
                                        <a href="hamburguesa.jsp"><img src="images/images_2016/hamburguesa.gif" width="123" height="31" longdesc="http://DFGDF" /></a>
                                        <a href="pasta.jsp"><img src="images/images_2016/pasta.gif" width="58" height="31" longdesc="http://DFGH" /></a>
                                        <a href="ensalada.jsp"><img src="images/images_2016/ensaladas.gif" width="94" height="31" longdesc="http://DFGH" /></a>
                                        <a href="bebidas.jsp"><img src="images/images_2016/bebidas.gif" width="76" height="31" longdesc="http://SFGHDF" /></a>
                                        <a href="postres.jsp"><img src="images/images_2016/postres.gif" width="70" height="31" alt="" longdesc="http://SDF" /></a>
                                    </td>
                                    <td width="7%" bgcolor="#FFFFFF">&nbsp;</td>
                                </tr>
                                <tr bordercolor="#FF0000" bgcolor="#FF0000">
                                    <td width="4%" bgcolor="#FFFFFF">&nbsp;</td>
                                    <td width="46%">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td width="7%" bgcolor="#FFFFFF">&nbsp;</td>
                                </tr>
                                <form action="ServletEnviar" method="post">
                                <tr>
                                    <td width="4%" bgcolor="#FFFFFF">&nbsp;</td>
                                    <td align="left" width="44%" class="centro">
                                        <h3>Gracias <%=nombre%> su pedido ha sido tramitado las <%=hora%> del <%=fechaF%> y consta de los siguientes productos:</h3>
                                           <ul>
                                               <%if(sesion.getAttribute("menu")!=""){%>Menu
                                                <li><%=sesion.getAttribute("numeroMenu")%> <%=sesion.getAttribute("menu")%></li>
                                               <%}%>
                                               <%if(sesion.getAttribute("pizza")!=""){%>Pizza
                                                <li><%=sesion.getAttribute("numeroPizza")%> <%=sesion.getAttribute("pizza")%></li>
                                               <%}%>
                                               <%if(sesion.getAttribute("entrante")!=""){%>Entrante
                                                <li><%=sesion.getAttribute("numeroEntrante")%> <%=sesion.getAttribute("entrante")%></li>
                                               <%}%>
                                               <%if(sesion.getAttribute("hamburguesa")!=""){%>Hamburguesa
                                                <li><%=sesion.getAttribute("numeroHamburguesa")%> <%=sesion.getAttribute("hamburguesa")%></li>
                                               <%}%>
                                               <%if(sesion.getAttribute("ensalada")!=""){%>Ensalada
                                                <li><%=sesion.getAttribute("numeroEnsalada")%> <%=sesion.getAttribute("ensalada")%></li>
                                               <%}%>
                                               <%if(sesion.getAttribute("bebida")!=""){%>Bebida
                                                <li><%=sesion.getAttribute("numeroBebida")%> <%=sesion.getAttribute("bebida")%></li>
                                               <%}%>
                                               <%if(sesion.getAttribute("postre")!=""){%>Postre
                                                <li><%=sesion.getAttribute("numeroPostre")%> <%=sesion.getAttribute("postre")%></li>
                                               <%}%>
                                           </ul>
                                               <%if(request.getParameter("envio").equals("domicilio")){%>
                                               <h3>aproximadamente en 30 minutos será servido el pedido en su domicilio</h3>
                                               <%}%>
                                               <%if(request.getParameter("envio").equals("tienda")){%>
                                               <h3>aproximadamente en 30 minutos puedes pasarte a por el pedido</h3>
                                               <%}%>
                                    
                                    </td>
                                    <td align="right" colspan="2">
                                        <img src="images/images_2016/gracias.gif" alt=""></td>
                                    <td width="7%" bgcolor="#FFFFFF"></td>
                                </tr>
                                    
                                <tr bgcolor="#990000">
                                    <td width="4%" bgcolor="#FFFFFF">&nbsp;</td>
                                    <td align="left" width="46%"><img src="images/images_2016/telepizza_espana.gif" width="133" height="30" /></td>
                                    <td align="right" colspan="2"><img src="images/images_2016/ico_facebook.gif" width="31" height="30" /> <img src="images/images_2016/ico_twitter.gif" width="31" height="30" /> <img src="images/images_2016/ico_youtube.gif" width="31" height="30" /> <img src="images/images_2016/ico_google.gif" width="31" height="30" /> <img src="images/images_2016/ico_instagram.gif" width="31" height="30" />&nbsp; </td>
                                    <td width="7%" bgcolor="#FFFFFF">&nbsp;</td>
                                </tr>
                            </table>

                        </body>

                        </html>