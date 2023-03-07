<%-- A simple web application is developed with Java Server Page. It shows an image of a medal based
on the value of an input mark. The application is composed of medalDB.jsp, q1.jsp and
q1Handler.jsp.
• The medalDB.jsp defines a String[] getAllMedals method in JSP declaration. The
method returns all image locations in String array.
• The q1.jsp shows images of medals in table format and an input form for user submission. The
locations of medal images are specified in the getAllMedals method.
• The q1Handler.jsp obtains input parameter, mark, validates input parameter and displays the
corresponding value of the mark. It also displays a corresponding medal image if the mark is within a
specific range. The mark range is between 50 to 100 inclusively. If user does not submit a parameter,
mark, then an error message will be displayed --%>

<%-- (a) In medalDB.jsp, write JSP Declaration to define a public String[] getAllMedals() method that returns all image locations in String array. The image locations are "img/Gold.png", "img/Silver.png" and "img/ Bronze.png" respectively --%>

<!--part (a) (i)-->
<%
public String[] getAllMedals() {
String[] medals = {"img/Gold.png", "img/Silver.png", "img/Bronze.png"};
return medals;
}

//(b) With reference to the sample output of the q1.jsp, write code to complete the following tasks.
//(i) Write a JSP Directive to include the medalDB.jsp. [2%]
//(ii) Write JSP Scriptlet to output the table as per the Figure Q1a. You are MUST use the getAllMedals () method. [5%]
//(iii) Write HTML code to show an input form. [3%] 

//<!-- part (b) (i) -->
<%@ include file="medalDB.jsp" %>

<!DOCTYPE html> <html><head><title>q1</title> </head> <body>
 <h1>Medals </h1>
 <table border="1">
 <!-- part (b) (ii) -->
<tr> <td> <img src="<%= getAllMedals()[0] %>" alt="Gold Medal" width="100" height="100"/> </td>
<td> <img src="<%= getAllMedals()[1] %>" alt="Silver Medal" width="100" height="100"/> </td>
<td> <img src="<%= getAllMedals()[2] %>" alt="Bronze Medal" width="100" height="100"/> </td>
</tr>
 <tr> <td> Gold </td> <td> Silver </td> <td> Bronze </td> </tr>
 </table>
 <hr/>
 <!-- part (b) (iii) -->
    <form action="q1Handler.jsp" method="get">
        <label for="mark">Enter your mark: </label>
        <input type="text" name="mark" id="mark" />
        <input type="submit" value="Submit" />
    </form>
</body></html>

(c) With reference to the q1Handler.jsp and the figure Q1b, complete the following task:
(i) Obtain the parameter, mark, and assign it to input. [1%]
(ii) If the parameter, input, is not submitted, output the following message “You did not submit any value!!” [2%]
(iii) If the parameter, input is submitted, parse input to an integer and assign it to the variable mark. Use the getAllMedals() method and output corresponding image. The range of the medals defined as follows. [5%]
Gold: Between 75 to 100 (inclusive)
Silver: Between 60 to 74 (inclusive)
Bronze: Between 50 to 59 (inclusive)
(iv) Use JSP Expression to display the value of the mark. [1%]
(v) Write HTML to display a hyperlink linked to q1.jsp for trying again. [1%]
(vi) Write JSP Directive in q1Handler.jsp to pass the exception to handleError.jsp.
Assume the handleError.jsp is already defined. [2%]

<!-- Assume the medalDB.jsp is properly included -->
<!DOCTYPE html>
<html><head><title>q1Handler</title> </head>
<body>
 <% String input = ""; int mark = 0;
     input = request.getParameter("mark");
 // part (c) (i), (ii), (iii)
    // method 1
    if (input == null || input.isEmpty()) {
		out.println("You did not submit any value!!");
	} else {
		int mark = Integer.parseInt(input);
		String[] medals = getAllMedals();
		String medalImg = "";
        if (mark >= 75 && mark <= 100) {
            medalImg = medals[0];
        } else if (mark >= 60 && mark <= 74) {
            medalImg = medals[1];
        } else if (mark >= 50 && mark <= 59) {
            medalImg = medals[2];
        }
        out.println("<img src=\"" + medalImg + "\" alt=\"Medal\" width=\"100\" height=\"100\"/>");
    }
    // method 2
    if (input == null) {
        out.println("You did not submit any value!!");
    } else {
        mark = Integer.parseInt(input);
        if (mark >= 75 && mark <= 100) {
            out.println("<img src=\"" + getAllMedals()[0] + "\" alt=\"Gold Medal\" width=\"100\" height=\"100\"/>");
        } else if (mark >= 60 && mark <= 74) {
            out.println("<img src=\"" + getAllMedals()[1] + "\" alt=\"Silver Medal\" width=\"100\" height=\"100\"/>");
        } else if (mark >= 50 && mark <= 59) {
            out.println("<img src=\"" + getAllMedals()[2] + "\" alt=\"Bronze Medal\" width=\"100\" height=\"100\"/>");
        }
    }
 %>
 <h2> Your input mark is
  <!-- part (c) (iv) -->
<%= mark %>
  </h2>
 <!-- part (c) (v) -->
<a href="q1.jsp">Try again</a>
<!-- part (c) (vi) -->
<%@ page isErrorPage="true" %>
 </body>
</html>



Q2

<%-- A web application built with the technologies, JSP, JavaBeans and Servlet for displaying product
information.
• The JSP page, enquiry.jsp, is an input form. It allows multiple selection for product codes.
• The Java servlet class, ict.servlet.ProductController, handles inputted parameter,
obtains the corresponding product information from database and displays it accordingly.
• The class, ict.db.ProductDB, provides methods to handle the database operations.
• A JavaBean class, ict.bean.Product, is used to support the form operations --%>

(a) Write down the well-formed HTML in the enquiry.jsp in the Figure Q2d to display the sample output as per the Figure Q2a

<!-- part (a) -->
<!DOCTYPE html>
<html><head><title>enquiry</title> </head>
<body>
    <h1>Check Product Info</h1>
    <form action="ProductController" method="get">
        <select name="product" id="product" multiple>
            <option value="P001">p1</option>
            <option value="P002">p2</option>
            <option value="P003">p3</option>
        </select>
        <input type="submit" value="Submit" />
        <input type="reset" value="Reset" />
    </form>
</body></html>

(b) Write code for completing the implementation of the java bean class ict.bean.Product class to support the web application development.

<%-- part (b) --%>
<%-- package ict.bean;
public class Product {
    private String code;
    private double price;
    private String description;
    public Product() {
        code = "";
        price = 0.0;
        description = "";
    }
    public Product(String code, double price, String description) {
        this.code = code;
        this.price = price;
        this.description = description;
    }
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
} --%>

(c) Refer to the sample output shown in the Figure Q2b and write code to complete the implementation
of the servlet. [15%]
(i) Map the request, productInfo, with the name, controller, to the ict.servlet.
ProductController.java.
(ii) Generalize the class to support servlet implementation.
(iii) State the name of the method.
(iv) Obtain the output stream from the response.
(v) Get input value, code, from request.
(vi) If no selection is made the checkbox, display a warning message, “No selection is made” and display a hyperlink linked to enquiry.jsp for try again; Otherwise, Use the ProductDB to obtain the relevant product information and display the result as per the sample out in the Sample code.

<%-- part (c) --%>
package ict.servlet;
// assume the library is properly imported
import ict.db.ProductDB;
import ict.bean.Product;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

<!-- part (c) (i) -->
@WebServlet(name = "controller", urlPatterns = { "/productInfo" })

public class ProductController 
<!-- part (c) (ii) -->
extends HttpServlet
{
 protected void c(iii)(HttpServletRequest request,
 HttpServletResponse response)
 throws ServletException, IOException {
 PrintWriter out; String action =””;
 String[]codes = null;
<!-- part  (c)(iv), (v), (vi) -->
    out = response.getWriter();
    codes = request.getParameterValues("product");
    if (codes == null) {
        out.println("No selection is made");
        out.println("<a href=\"enquiry.jsp\">Try again</a>");
    } else {
        ProductDB db = new ProductDB();
        for (String code : codes) {
            Product p = db.getProduct(code);
            out.println("<p>Code: " + p.getCode() + "</p>");
            out.println("<p>Price: " + p.getPrice() + "</p>");
            out.println("<p>Description: " + p.getDescription() + "</p>");
        }
    }
 }
}

//method 2
package ict.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ict.db.ProductDB;
import ict.bean.Product;

public class ProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String action = "";
        String[] codes = null;

        // Map the request, productInfo, with the name, controller
        action = request.getParameter("productInfo");

        if (action == null) {
            out.println("<p>No selection is made</p>");
            out.println("<a href=\"enquiry.jsp\">Try Again</a>");
        } else {
            // Get input value, code, from request
            codes = request.getParameterValues("productCodes");
            ProductDB pdb = new ProductDB();
            for (String code : codes) {
                // Use the ProductDB to obtain the relevant product information
                Product p = pdb.getProduct(code);
                // Display the result as per the sample out in the package ict.servlet
                out.println("<p>Product Code: " + p.getCode() + "</p>");
                out.println("<p>Product Name: " + p.getName() + "</p>");
                out.println("<p>Product Description: " + p.getDescription() + "</p>");
                out.println("<p>Product Price: " + p.getPrice() + "</p>");
            }
        }
    }
}


Q3:
(a) State the methods in a servlet and briefly explain how the methods affect the servlet life cycle.
The following are the methods in a Servlet and how they affect the servlet life cycle:

init() method: This method is called by the servlet container when the servlet is first created. It is used to perform initialization tasks such as opening database connections, reading configuration files, etc. This method is called only once during the life cycle of a servlet.

service() method: This method is called by the servlet container to handle each client request. The service() method receives the request, processes it, and generates the response. This method can be called multiple times during the life cycle of a servlet, once for each client request.

destroy() method: This method is called by the servlet container when the servlet is about to be destroyed. It is used to perform clean-up tasks such as closing database connections, releasing resources, etc. This method is called only once during the life cycle of a servlet.

doGet(), doPost(), doPut(), doDelete() and other HTTP-specific methods: These methods are called by the servlet container when the servlet receives an HTTP request with the corresponding HTTP method. For example, the doGet() method is called when the servlet receives an HTTP GET request. These methods are typically implemented to handle specific types of requests.

getServletConfig() and getServletInfo() methods: These methods are called by the servlet container to retrieve configuration information and descriptive information about the servlet, respectively.

Overall, these methods work together to define the life cycle of a servlet, from initialization to destruction, and allow the servlet to handle client requests efficiently and effectively.

(b) Briefly describe Four type of scope with respect to the accessibility in JEE application.
In Java Enterprise Edition (JEE) applications, scope refers to the accessibility or visibility of an object or data within different parts of the application. There are four main types of scopes in JEE, each with a different level of accessibility.

Application Scope: This scope is the broadest and lasts for the entire lifecycle of the application. Objects stored in this scope are accessible to all users and all parts of the application. Application scope is typically used for data that is common across all users, such as configuration parameters, application settings, or cached data.

Session Scope: This scope is specific to each user session and lasts for the duration of the user's interaction with the application. Objects stored in this scope are accessible only to the user who created them and are available across multiple requests within the same session. Session scope is typically used for data that is specific to each user, such as shopping cart items, user preferences, or user-specific data.

Request Scope: This scope is specific to each user request and lasts only for the duration of the request. Objects stored in this scope are accessible only to the current request and are discarded after the response is sent back to the user. Request scope is typically used for data that is needed for a single request and does not need to be retained for subsequent requests.

Page Scope: This scope is specific to each page or view within the application and lasts only for the duration of that page or view. Objects stored in this scope are accessible only to the current page or view and are discarded when the user navigates away from that page or view. Page scope is typically used for data that is needed for a single page or view and does not need to be retained for subsequent pages or views.

Understanding the different types of scopes in JEE is important for designing and implementing robust and efficient applications that can manage data and resources effectively.
