<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	function fncAddPurchase() {
		//document.addPurchase.submit();
		$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();

	}

	$(function(){
		$("img[src='../images/ct_icon_date.gif']").on("click",function(){
		 show_calendar('document.addPurchase.dlvyDate', $("img[src='../images/ct_icon_date.gif']").val());
		     });
		
		$( "div button:contains('구매')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
			fncAddPurchase();
			});
		
		$( "div button:contains('취소')" ).on("click" , function() {
			 //Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			$("form")[0].reset();	

			});
	});
	
	$(function(){
		$("#datepicker").datepicker({dateFormat:"yy-mm-dd", 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
			  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

		});
				
	
	
	
	});
</script>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">상 품 구 매</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value= "${product.prodNo}">
		    </div>
		  </div>
		  
		  
		 <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		    </div>
		  </div>
		
		
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"   name="manuDate" value="${product.manuDate}">
		       <!-- <span id="helpBlock" class="help-block">
		      	<strong class="text-danger" >제조일자를 선택하세요</strong>
		      </span> -->
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="regDate" name="regDate" value="${product.price}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자ID</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyerId" name="buyerId" value="${user.userId}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		    <select name="paymentOption" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">현금구매</option>
				<option value="2"					 >신용구매</option>
			</select>
		     <%--  <input type="text" class="form-control" id="paymentOption" name="paymentOption" value="${user.userId}"> --%>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">배송지</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${user.addr}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" >
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  id="datepicker" name="dlvyDate" placeholder="이곳을 클릭하여 배송희망일자를 선택해 주세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger" >배송희망일자를 선택하세요</strong>
		      </span>
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구매</button>
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>