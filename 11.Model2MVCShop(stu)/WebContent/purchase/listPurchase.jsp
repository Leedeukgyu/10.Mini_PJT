<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
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
									+"아이디 : "+JSONData.user.userId+"<br/>"
									+"이  름 : "+JSONData.user.userName+"<br/>"
									+"이메일 : "+JSONData.user.email+"<br/>"
									+"ROLE : "+JSONData.user.role+"<br/>"
									+"등록일 : "+JSONData.user.regDate+"<br/>"
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
							+"물품번호       : "+JSONData.purchase.purchaseProd.prodNo+"<br/>"
							+"구매자아이디 : "+JSONData.purchase.buyer.userId+"<br/>"
							+"구매방법       : ";
								if(JSONData.purchase.paymentOption==1){
								displayValue+=JSONData.purchase.paymentOption='현금결제';
								
							}else{
								displayValue+=JSONData.purchase.paymentOption='신용결제';
							}
							displayValue+="<br/>"
							+"구매자이름    : "+JSONData.purchase.receiverName+"<br/>"
							+"구매자연락처 : "+JSONData.purchase.receiverPhone+"<br/>"
							+"구매자주소    : "+JSONData.purchase.dlvyAddr+"<br/>"
							+"구매요청사항 : "+JSONData.purchase.dlvyRequest+"<br/>"
							+"배송희망일    : "+JSONData.purchase.dlvyDate+"<br/>"
							+"주문일          : "+JSONData.purchase.orderDate+"<br/>";
							//displayValue+="<input id='update' type='button' value='수정'/>";
							displayValue+="<input id='detail' type='button' value='상세보기'/>";
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
				+"물품번호       : "+JSONData.purchase.purchaseProd.prodNo+"<br/>"
				+"구매자아이디 : "+JSONData.purchase.buyer.userId+"<br/>"
				+"구매방법       : ";
					if(JSONData.purchase.paymentOption==1){
					displayValue+=JSONData.purchase.paymentOption='현금결제';
					
				}else{
					displayValue+=JSONData.purchase.paymentOption='신용결제';
				}
				displayValue+="<br/>"
				+"구매자이름    : "+JSONData.purchase.receiverName+"<br/>"
				+"구매자연락처 : "+JSONData.purchase.receiverPhone+"<br/>"
				+"구매자주소    : "+JSONData.purchase.dlvyAddr+"<br/>"
				+"구매요청사항 : "+JSONData.purchase.dlvyRequest+"<br/>"
				+"배송희망일    : "+JSONData.purchase.dlvyDate+"<br/>"
				+"주문일          : "+JSONData.purchase.orderDate+"<br/>";
				//displayValue+="<input id='update' type='button' value='수정'/>";
				displayValue+="<input id='detail' type='button' value='상세보기'/>";
				displayValue+="</h7>"
							  +"</div>";
		});
		
		$("td span.updateTranCode").on("click",function(){
			alert("물건도착");
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
					alert("이용해 주셔서 감사합니다.");
				}
					
				});
		});
		
		
		
		//==> 아래와 같이 정의한 이유는 ??
		//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});

	</script>
</head>
<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
		
	    <c:if test="${param.menu !='manage' }">
	       <h3>구매목록조회</h3>
	    </c:if>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
 
		  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div> 
	    	
		</div>

      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원ID</th>
            <th align="left">회원명</th>
            <th align="left">전화번호</th>
            <th align="left">배송현황</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			<td align="center"  title="Click : 구매정보 확인">
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
			  	<c:when test="${purchase.tranCode.trim()=='1'}">현재 구매완료 상태입니다.</c:when>
			  	<c:when test="${purchase.tranCode.trim()=='2'}">현재 배송중 상태입니다.
			  	<span class="updateTranCode" tranNo="${purchase.tranNo}">
			  	물건도착
			  	</span>
			  	</c:when>
			  	<c:when test="${purchase.tranCode.trim()=='3'}">현재 배송완료 상태입니다.</c:when>
			  </c:choose>
			<td align="left"  title="Click : 구매간략정보보기"   >
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