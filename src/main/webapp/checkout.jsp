<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ include
file="/includes/header.jsp" %>
<h1>Checkout</h1>

<table>
  <tr>
    <th>Description</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>Total</th>
  </tr>

  <c:forEach var="item" items="${cart.items}">
    <tr>
      <td><c:out value="${item.product.description}" /></td>
      <td><c:out value="${item.quantity}" /></td>
      <td><c:out value="${item.product.priceCurrencyFormat}" /></td>
      <td><c:out value="${item.totalCurrencyFormat}" /></td>
    </tr>
  </c:forEach>
</table>

<div class="order-total">Order Total: ${cart.totalCurrencyFormat}</div>

<p>Thanks for your order!</p>
<p>Your order has been processed.</p>

<form action="cart" method="post">
  <input type="hidden" name="action" value="shop" />
  <input type="submit" value="Continue Shopping" />
</form>
<%@ include file="/includes/footer.jsp" %>
