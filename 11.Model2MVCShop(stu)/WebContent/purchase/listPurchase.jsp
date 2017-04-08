<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	<!-- accordion -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- accordion -->
  
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function fncGetAllList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();	
		console.log( "/purchase/listPurcase?menu=search");
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase?menu=search").submit();
	}
	$(function(){

		/* $(".getUser").on(function(){
				
			//self.location="/user/getUser?userId="+$(this).attr("sendValue");
			var userId=$(this).attr("userId").trim();
			//alert($("#json").text);
			$.ajax(
				 {
					 url : "/user/getJsonUser/"+userId,
					 method : "GET",
					 dataType : "json",
					 headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					 },
					 success : function(JSONData , status) {
						 
						 //alert("JSONData : \n"+JSONData);
						//	alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
								
							var displayValue ="<span class='json'>"
									+"<h3>"
									+"���̵� : "+JSONData.user.userId+"<br/>"
									+"��  �� : "+JSONData.user.userName+"<br/>"
									+"�̸��� : "+JSONData.user.email+"<br/>"
									+"ROLE : "+JSONData.user.role+"<br/>"
									+"����� : "+JSONData.user.regDate+"<br/>"
									+"</h3>"
									+"</span>";
							//Debug...									
							//alert(displayValue);
					
					//		$("h3").remove();
							$( "#"+userId+"" ).html(displayValue);
							
							 $("#getUser").mouseleave(function(){
									$(".json").remove();
									${JSONData.user.userId}
									
								});
					 }
					
				 });
			
			
			
		}); */
		
		$("td i").on("click",function(){
			$("td i.glyphicon glyphicon-ok").css("color","green");
			//self.location="/purchase/getPurchase?tranNo="+$(this).attr("sendValue");
			var tranNo=$(this).attr("tranNo").trim();
			$.ajax(
			{
				url : "/purchase/getJsonPurchase/"+tranNo,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					/* $(document).on("click" ,'#update', function() {
						
						alert("update");
						self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}"
					}); */
				 $(document).on("click" ,'#detail', function() {
						//alert("detail");
						self.location = "/purchase/getPurchase?tranNo="+tranNo;
							
					});
					
					var displayValue = "<h7>"
							+"��ǰ��ȣ       : "+JSONData.purchase.purchaseProd.prodNo+"<br/>"
							+"�����ھ��̵� : "+JSONData.purchase.buyer.userId+"<br/>"
							+"���Ź��       : ";
								if(JSONData.purchase.paymentOption==1){
								displayValue+=JSONData.purchase.paymentOption='���ݰ���';
								
							}else{
								displayValue+=JSONData.purchase.paymentOption='�ſ����';
							}
							displayValue+="<br/>"
							+"�������̸�    : "+JSONData.purchase.receiverName+"<br/>"
							+"�����ڿ���ó : "+JSONData.purchase.receiverPhone+"<br/>"
							+"�������ּ�    : "+JSONData.purchase.dlvyAddr+"<br/>"
							+"���ſ�û���� : "+JSONData.purchase.dlvyRequest+"<br/>"
							+"��������    : "+JSONData.purchase.dlvyDate+"<br/>"
							+"�ֹ���          : "+JSONData.purchase.orderDate+"<br/>";
							//displayValue+="<input id='update' type='button' value='����'/>";
							displayValue+="<input id='detail' type='button' value='�󼼺���'/>";
							displayValue+="</h7>";
							
					//Debug...									
					//alert(displayValue);
					$("div h7").remove();
					$( "#"+tranNo+"" ).html(displayValue);
				}
				
				}		
			)
			
			var displayValue = "<div id='accordion'>"
				+"<h7>$()</h7>"
				+"��ǰ��ȣ       : "+JSONData.purchase.purchaseProd.prodNo+"<br/>"
				+"�����ھ��̵� : "+JSONData.purchase.buyer.userId+"<br/>"
				+"���Ź��       : ";
					if(JSONData.purchase.paymentOption==1){
					displayValue+=JSONData.purchase.paymentOption='���ݰ���';
					
				}else{
					displayValue+=JSONData.purchase.paymentOption='�ſ����';
				}
				displayValue+="<br/>"
				+"�������̸�    : "+JSONData.purchase.receiverName+"<br/>"
				+"�����ڿ���ó : "+JSONData.purchase.receiverPhone+"<br/>"
				+"�������ּ�    : "+JSONData.purchase.dlvyAddr+"<br/>"
				+"���ſ�û���� : "+JSONData.purchase.dlvyRequest+"<br/>"
				+"��������    : "+JSONData.purchase.dlvyDate+"<br/>"
				+"�ֹ���          : "+JSONData.purchase.orderDate+"<br/>";
				//displayValue+="<input id='update' type='button' value='����'/>";
				displayValue+="<input id='detail' type='button' value='�󼼺���'/>";
				displayValue+="</h7>"
							  +"</div>";
		});
		
		$("td span.updateTranCode").on("click",function(){
			alert("���ǵ���");
			alert(tranNo);
			$("td span.updateTranCode").css("color","green");
			//self.location="/purchase/updateTranCode?tranNo="+$(this).attr("tranNo")+"&tranCode="+$(this).attr("tranCode");
			var tranNo=$(this).attr('tranNo').trim();
			
			$.ajax({
				
				url:"/purchase/updateJsonTranCode/"+tranNo,
				method:"GET",
				dataType:"json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					alert("�̿��� �ּż� �����մϴ�.");
				}
					
				});
		});
		
		
		
		//==> �Ʒ��� ���� ������ ������ ??
		//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});

	</script>
</head>
<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
		
	    <c:if test="${param.menu !='manage' }">
	       <h3>���Ÿ����ȸ</h3>
	    </c:if>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
 
		  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div> 
	    	
		</div>

      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ��ID</th>
            <th align="left">ȸ����</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			<td align="center"  title="Click : �������� Ȯ��">
			<span id="getPurchase" tranNo="${purchase.tranNo}">
			${ i }
			</span>
			</td>
			
			 <td align="left" id="${purchase.buyer.userId}" >
			 <span class="getUser" userId="${purchase.buyer.userId}">
			 ${purchase.buyer.userId}
			 </span>
			 </td>
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.receiverPhone}</td>
			  <td align="left">
			  ${purchase.tranCode}
			  <c:choose>
			  	<c:when test="${purchase.tranCode.trim()=='1'}">���� ���ſϷ� �����Դϴ�.</c:when>
			  	<c:when test="${purchase.tranCode.trim()=='2'}">���� ����� �����Դϴ�.
			  	<span class="updateTranCode" tranNo="${purchase.tranNo}">
			  	���ǵ���
			  	</span>
			  	</c:when>
			  	<c:when test="${purchase.tranCode.trim()=='3'}">���� ��ۿϷ� �����Դϴ�.</c:when>
			  </c:choose>
			<td align="left"  title="Click : ���Ű�����������"   >
		   <i class="glyphicon glyphicon-ok" tranNo="${purchase.tranNo}" id= "${purchase.tranNo}" ></i>
			 
		</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	 
 	</div>
 
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	
</body>

</html>