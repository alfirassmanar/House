<%@ page session="true" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="jp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jp:mondrianQuery 
id="query01" 
jdbcDriver="com.mysql.jdbc.Driver" 
jdbcUrl="jdbc:mysql://localhost/dw_adventureworks?user=root&password=" 
catalogUri="/WEB-INF/queries/Schema_dwo_adventureworks.xml">
select {[measures].[mQuantity]} on columns,
{([dTime].[All Time],[dProduct].[All Product],
  [dVendor].[All Vendor],[dLocation].[All Location])} on rows
from cProduction
</jp:mondrianQuery>


<c:set var="title01" scope="session">My Adventureworks => Production</c:set>
