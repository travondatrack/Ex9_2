<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/header.jsp" %>
    <!-- Welcome message removed -->
    
    <h1>CD list</h1>
    <table>
        <tr>
            <th>Description</th>
            <th>Price</th>
            <th>&nbsp;</th>
        </tr>
        
        <c:forEach var="product" items="${products}">
        <tr>
            <td><c:out value="${product.description}"/></td>
            <td class="right"><c:out value="${product.priceCurrencyFormat}"/></td>
            <td class="button-cell">
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="<c:out value='${product.code}'/>">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
        </c:forEach>
        
        <c:if test="${empty products}">
        <!-- Fallback static content if products are not loaded -->
        <tr>
            <td>86 (the band) - True Life Songs and Pictures</td>
            <td>$14.95</td>
            <td class="button-cell">
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="8601">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
        <tr>
            <td>Paddlefoot - The first CD</td>
            <td>$12.95</td>
            <td class="button-cell">
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="pf01">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
        <tr>
            <td>Paddlefoot - The second CD</td>
            <td>$14.95</td>
            <td class="button-cell">
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="pf02">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
        <tr>
            <td>Joe Rut - Genuine Wood Grained Finish</td>
            <td>$14.95</td>
            <td class="button-cell">
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="jr01">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
        </c:if>
    </table>
<%@ include file="/includes/footer.jsp" %>
