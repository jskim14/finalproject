<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="${path}/WEB-INF/views/common/header.jsp"/>

<style>
    section{
       padding:200px 10%;
       min-height:800px;
    }
    #notice-title{text-align: center;}
</style>


        <section>
            
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <button onclick="fn_ajax('notice');">공지사항</button>
              
                <button onclick="fn_ajax('qna');">자주 묻는 질문</button>

              </div>
              
            <div id="notice-title">
                <h2>공지사항</h2>
            </div>
            
            <br>
            <div style="width:100%; height:3px; background-color: lightskyblue;"></div>
            
            <div id="table_"></div> 
        </section>
        
        <script>
        	const fn_ajax=(choice)=>{
        		$.ajax({
        			url:"${path}/customerserviceList",
        			data:{"choice":choice},
        			success:(data)=>{
        				$("#table_").html("");
        				switch(choice){
        				case "notice": noticePrint(data); break;
        				case "qna": qnaPrint(data); break;
        				case "one2one": one2onePrint(data); break;
        				}
        				$("#table_").html(data);
        			}
        		});
        	}
        	
        	const noticePrint=(data)=>{
        		const table=$("<table>").addClass("table table-hover");
        		const header=$("<tr>");
        		table.append(header);
        		
        		data.forEach((v,i)=>{
        			let tr=$("<tr>");
        			let title=$("<td>").html(v["title"]);
        			let noticeDate=$("<td>").html(v["noticeDate"]);
        			tr.append(title).append(noticeDate);
        			table.append(tr);
        		});
        		$("#table_"),append(table);
        	}
        	
        	const qnaPrint=(data)=>{
        		const table=$("<table>").addClass("table table-hover");
        		const header=$("<tr>");
        		table.append(header);
        		
        		data.forEach((v,i)=>{
        			let tr=$("<tr>");
        			let title=$("<td>").html(v["title"]);
        			let noticeDate=$("<td>").html(v["qnaDate"]);
        			tr.append(title).append(noticeDate);
        			table.append(tr);
        		});
        		$("#table_"),append(table);
        	}

        	
        </script>
<jsp:include page="${path }/WEB-INF/views/common/footer.jsp"/>