<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="report_date">日付</label><br />
<input type="date" name="report_date" value="<fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_employee.name}" />
<br /><br />

<label for="title">タイトル</label><br />
<input type="text" name="title" value="${report.title}" />
<br /><br />


<label for="title">顧客名（任意入力）</label><br />
<input type="text" name="client" value="${report.client}" />
<br /><br />


<label for="admin_flag">進捗状況（任意選択）</label><br />
<select name="admin_flag">
    <option value="0"<c:if test="${employee.admin_flag == 0}"> selected</c:if>>訪問打診中</option>
    <option value="1"<c:if test="${employee.admin_flag == 1}"> selected</c:if>>訪問予定あり</option>
    <option value="2"<c:if test="${employee.admin_flag == 2}"> selected</c:if>>検討中</option>
    <option value="3"<c:if test="${employee.admin_flag == 3}"> selected</c:if>>次回納品</option>
    <option value="4"<c:if test="${employee.admin_flag == 4}"> selected</c:if>>納品済み</option>
    <option value="5"<c:if test="${employee.admin_flag == 5}"> selected</c:if>>その他</option>
    <option value="6"<c:if test="${employee.admin_flag == 6}"> selected</c:if>>見込みなし</option>
</select>


<br /><br />



<label for="content">内容</label><br />
<textarea name="content" rows="10" cols="50">${report.content}</textarea>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>