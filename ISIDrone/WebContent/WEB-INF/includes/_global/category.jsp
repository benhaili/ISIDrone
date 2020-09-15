<%@page import="entities.User"%>
<%@page import="action.ActionCategory"%>
<%@page import="java.util.ArrayList, entities.Category"%>
<%
    //V�rification si la cat�gorie s�lectionne est valide (Un utilisateur pourrait tenter d'entr� une cat�gorie invalide dans la barre d'adresse)
    @SuppressWarnings(  "unchecked")
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    User user = (User) session.getAttribute("user");
    int categorySelected = ActionCategory.getSelectedCategory(request, response);

    if (categories != null && categories.size() > 0) {
        for (Category category : categories) {
            if (user != null && user.getUserRole() == 1) {%>
                <a href="items?category=<%=category.getId()%>&effacer=false" class="list-group-item<%=(category.getId() == categorySelected ? " active" : "")%>"><%=category.getName()%></a>
            <%}else{
                if(category.isIsActive() == true){%>
                    <a href="items?category=<%=category.getId()%>&effacer=false" class="list-group-item<%=(category.getId() == categorySelected ? " active" : "")%>"><%=category.getName()%></a>
               <%}
            }%>
<%
    }
} else {
%>
Aucune Cat�gorie n'est pr�sente pour le moment.
<%
    }
%>