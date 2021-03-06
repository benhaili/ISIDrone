<%-- 
    Document   : listProducts
    Created on : Sep 4, 2020, 10:31:17 AM
    Author     : rcorroch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Item"%>
<%@page import="manager.MCategory" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entities.ItemCart"%>
<%@page import="java.util.List"%>
<%@page import="util.Const"%>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<%ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("listitems");%>
<!DOCTYPE html>

<div class="container">
    <div class="row">


        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Liste des Produits</strong></h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <%
                                if (items != null && items.size() != 0) {
                            %>
                            <thead>
                                <tr>

                                    <td class="text-center"><strong>Nom</strong></td>
                                    <td class="text-center"><strong>Catégorie</strong></td>
                                    <td class="text-center"><strong>Prix</strong></td>
                                    <td class="text-center"><strong>Quantité en stock</strong></td>
                                    <td class="text-center"><strong>Action</strong></td>
                                </tr>
                            </thead>
                            <%
                            } else {
                            %>
                            <span>Aucune item dans la base de donnes </span>
                            <%
                                }
                            %>
                            <%
                                int i = 0;
                                for (Item item : items) {
                                    i++;
                            %>

                            <tr>
                                <td style="hover"><%=item.getName()%></td>
                                <td class="text-center"><%=MCategory.getCategoryById(item.getCategory()).getName()%></td>
                                <td class="text-center"><%=item.getPrice()%></td>
                                <td class="text-center"><%=item.getStock()%></td>
                                <td class="text-center"><a href="editProduct?item=<%=item.getId()%>" class="btn btn-info btn-sm">Modifier</a></td>
                                <td class="text-center">
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal_<%=item.getId()%>">Supprimer</button>
                                    <div id="myModal_<%=item.getId()%>" class="modal fade" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h1 class="modal-title">ATTENTION </h1>
                                                </div>
                                                <div class="modal-body">
                                                    <h2>Est vous sure de vouloir supprimer cette produit ??? </h2>
                                                </div>
                                                <div class="modal-footer">


                                                    <a href="ListProducts?itemASupprimer=<%=item.getId()%>" class="btn btn-success" >oui</a> <!--class="btn btn-success" data-dismiss="modal">oui</a>-->
                                                    <a href="ListProducts?afficherTout=1" class="btn btn-danger" >non </a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </td>
                            </tr>

                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- Footer -->
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>