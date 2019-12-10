<%-- 
    Document   : ofertas
    Created on : 04-dic-2019, 11:33:54
    Author     : Alumno_2DAW
--%>

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
SimpleDateFormat formateador1= new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat formateador2= new SimpleDateFormat("kk:mm:ss");
String fecha = formateador1.format(sesion.getCreationTime());
String hora = formateador2.format(sesion.getCreationTime());
Bd bd = new Bd();
bd.abrirConexion();
List<Pedido> pedidos = bd.obtenerPostre();
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
                                            text-align: center;
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
                                        <tr>
                                            <td width="4%" bgcolor="#FFFFFF">&nbsp;</td>
                                            <td align="left" width="88%" class="centro">
                                                    <form action="mostrarPedido.jsp" method="POST">
                                                        <div class="medio">
                                                            <input type="radio"  name="envio" value="domicilio">Entrega a domicilio<br>
                                                        </div>
                                                        <div class="medio">
                                                            <input type="radio"  name="envio" value="tienda">Recoger en tienda<br>
                                                        </div>
                                                        <div class="entero"><input type="submit" value="Aceptar"></div>
                                                          </form>
                                            
                                            </td>
                                            <td width="7%" bgcolor="#FFFFFF"></td>
                                        </tr>
                                                </form>
                                        <tr bgcolor="#990000">
                                            <td width="4%" bgcolor="#FFFFFF">&nbsp;</td>
                                            <td align="left" width="46%"><img src="images/images_2016/telepizza_espana.gif" width="133" height="30" /></td>
                                            <td align="right" colspan="2"><img src="images/images_2016/ico_facebook.gif" width="31" height="30" /> <img src="images/images_2016/ico_twitter.gif" width="31" height="30" /> <img src="images/images_2016/ico_youtube.gif" width="31" height="30" /> <img src="images/images_2016/ico_google.gif" width="31" height="30" /> <img src="images/images_2016/ico_instagram.gif" width="31" height="30" />&nbsp; </td>
                                            <td width="7%" bgcolor="#FFFFFF">&nbsp;</td>
                                        </tr>
                                    </table>

                                </body>

                                </html>