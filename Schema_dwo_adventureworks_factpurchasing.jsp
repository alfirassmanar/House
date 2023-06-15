<%@ page session="true" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="jp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jp:mondrianQuery 
id="query01" 
jdbcDriver="com.mysql.jdbc.Driver" 
jdbcUrl="jdbc:mysql://localhost/dw_adventureworks?user=root&password=" 
catalogUri="/WEB-INF/queries/Schema_dwo_adventureworks_3.xml">
select {[measures].[mOrderqty],[measures].[mTotaldue]} on columns,
{([dTime].[All Time],[dPurchase].[All Purchase],[dVendor].[All Vendor],[dShipmethod].[All Ship Method])} on rows
from cPurchasing
</jp:mondrianQuery>


<c:set var="title01" scope="session">My Adventureworks => Purchasing</c:set>
