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
                <span class="btn btn-outline-dark" value="1">공지사항</span>
                <span class="btn btn-outline-dark" value="2">자주 묻는 질문</span>
				
              </div>
              
            <div id="notice-title">
                <h2>공지사항</h2>
            </div>
            
            <br>
            
            <table class="table table-hover">
            	<thead>
            		<tr>
            		<th class="table-dark">#</th>
            		<th class="table-dark">제목</th>
            		<th class="table-dark">날짜</th>
            		<tr>
            	</thead>
            	<tbody id="cslist">
            	</tbody>
            </table>
        </section>
        
        <script>
        	
			 $(function(){
				$.ajax({
					type:'POST',
					url:'${path}/customerServiceList',
					success:function(result)
					{
						console.log(result);
						let json=JSON.stringify(result);
						let res="";
						for(let i=0; i<json.length; i++)
							{
							res+="<tr>"
							+"<td>"+json[i].noticeNo+"</td>"
							+"<td>"+json[i].noticeTitle+"</td>"
							+"<td>"+json[i].noticeWriteDate+"</td>"
							}
						$('#cslist').html(res);
					}
				});
				$('span').click(function(){
					let choice=$(this).attr("value");
					$.ajax({
						type:'POST',
						url:'${path}/customerServiceList',
						data:{"choice":choice},
						success:function(result)
						{
							console.log(result);
							let json=JSON.stringify(result);
							let res="";
							for(let i=0; i<json.length; i++)
							{
							res+="<tr>"
							+"<td>"+json[i].noticeNo+"</td>"
							+"<td>"+json[i].noticeTitle+"</td>"
							+"<td>"+json[i].noticeWriteDate+"</td>"
							
							}
						$('#cslist').html(res);
						}
					});
				});
 			})    	
			
        </script>
        
<jsp:include page="${path }/WEB-INF/views/common/footer.jsp"/>