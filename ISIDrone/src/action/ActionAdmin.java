/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import manager.MAdmin;
/**
 *
 * @author rcorroch
 */
public class ActionAdmin {
     public static void getallitems(HttpServletRequest request) throws IOException {
        request.setAttribute("listitems", MAdmin.getallitems());
    }
}
