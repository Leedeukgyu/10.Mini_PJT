<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
		.jumbotron {
		jumbotron-size:200*100;
        font-size: 50px;
        font-weight: bold;
        text-align: center;
        background: url( "/images/uploadFiles/qkek1.jpg" );
      	}
     	.navbar-brand {
  	   	 float: left;
    	 height: 0px;
     	 padding: 10px 10px;
    	 font-size: 25px;
     	 line-height: 20px;
		}
    
	
	/* h1{
	 padding: 30px;
        font-size: 50px;
        font-weight: bold;
        text-align: center;
        background-color: rgba( 255, 255, 255, 0.5 );
	} */
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('Create account')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('Sign in')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
	

	
		
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
       <%--  <td align="left"  title="Click : 상품간략정보보기"   >
			   <span class="getProductSm">
		   <i class="glyphicon glyphicon-ok" prodNo="${product.prodNo}" menu="${ param.menu }" id= "${product.prodNo}" ></i>
			 </span> --%>
        	
        	<a class="navbar-brand glyphicon glyphicon-gift" href="#">MultiShop</a>
			<!-- toolBar Button Start //////////////////////// -->
		<!-- 	<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			toolBar Button End ////////////////////////
			
			<br/>
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	             	<div class="text-right">
	             <button type="button" class="btn btn-info ">sign in</button>
	             <button type="button" class="btn btn-info ">Create account</button>
	           	</div>
	           	</ul>
	       </div>-->
   		
   		</div> 
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu 구성 Start /////////////////////////////////////-->     	
			<!-- <div class="col-md-3">
		        
		       	 회원관리 목록에 제목
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
         			</div>
         			 회원관리 아이템
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">개인정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">회원정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">판매상품등록</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">판매상품관리</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> 상품구매
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">상품검색</a></li>
						  <li class="list-group-item">
						  	<a href="#">구매이력조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">최근본상품</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div> -->
			<!--  Menu 구성 end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-12">
	 	 		
	 	 		<br/>
				<div class="jumbotron" >
				<div class="text-center">
	 	 		
			  		<h1>Connect on Shop</h1>
			  		<p> </p>
			  		<p> </p>
			  		<p>로그인 하시면 쇼핑몰의 기능을 이용하실 수 있습니다. </p>
			  		<br/>
			  		</div>
			  		
			  		<div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button" >Sign in</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button" title="계정을만드세요!">Create account</a>
			  		</div>
			  	
			  	</div>
			  	
	        </div>
	        
	        <div class="row">
  <div class="col-sm-6 col-md-4 ">
    <div class="thumbnail">
      <img src="/images/uploadFiles/OCC_241466.jpg"  width="300" height="300" >
      <div class="caption">
        <h3>이달의 추천상품</h3>
        <p>남자친구가 좋아하는 그 향! 록시땅 핸드크림</p>
        <p><a href="#" class="btn btn-warning" role="button">구매하기</a> <a href="#" class="btn btn-default" role="button">상세보기</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4 ">
    <div class="thumbnail">
      <img src="/images/uploadFiles/1664288_1.jpg"  width="300" height="300">
      <div class="caption">
        <h3>판매량 1위 상품</h3>
        <p>이거바르고 여친이생겼어요 스케다 남성전용 스킨/로션 </p>
        <p><a href="#" class="btn btn-warning" role="button">구매하기</a> <a href="#" class="btn btn-default" role="button">상세보기</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4 ">
    <div class="thumbnail">
      <img src="/images/uploadFiles/20111129000312_0.jpg"  width="300" height="300">
      <div class="caption">
        <h3>입고예정상품</h3>
        <p>지렸다...남자의향기 불가리 뿌르옴므</p>
        <p><a href="#" class="btn btn-success" role="button">예약하기</a> <a href="#" class="btn btn-default" role="button">상세보기</a></p>
      </div>
    </div>
  </div>
</div>

<!-- <div class="container">
      Example row of columns
      <div class="row">
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div> -->


	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>