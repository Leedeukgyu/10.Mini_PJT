<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
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
		
		//============= ȸ�������� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('Create account')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
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
       <%--  <td align="left"  title="Click : ��ǰ������������"   >
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
   	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu ���� Start /////////////////////////////////////-->     	
			<!-- <div class="col-md-3">
		        
		       	 ȸ������ ��Ͽ� ����
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ȸ������
         			</div>
         			 ȸ������ ������
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">����������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">ȸ��������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ���</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ����</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> ��ǰ����
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">��ǰ�˻�</a></li>
						  <li class="list-group-item">
						  	<a href="#">�����̷���ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">�ֱٺ���ǰ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div> -->
			<!--  Menu ���� end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-12">
	 	 		
	 	 		<br/>
				<div class="jumbotron" >
				<div class="text-center">
	 	 		
			  		<h1>Connect on Shop</h1>
			  		<p> </p>
			  		<p> </p>
			  		<p>�α��� �Ͻø� ���θ��� ����� �̿��Ͻ� �� �ֽ��ϴ�. </p>
			  		<br/>
			  		</div>
			  		
			  		<div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button" >Sign in</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button" title="���������弼��!">Create account</a>
			  		</div>
			  	
			  	</div>
			  	
	        </div>
	        
	        <div class="row">
  <div class="col-sm-6 col-md-4 ">
    <div class="thumbnail">
      <img src="/images/uploadFiles/OCC_241466.jpg"  width="300" height="300" >
      <div class="caption">
        <h3>�̴��� ��õ��ǰ</h3>
        <p>����ģ���� �����ϴ� �� ��! �Ͻö� �ڵ�ũ��</p>
        <p><a href="#" class="btn btn-warning" role="button">�����ϱ�</a> <a href="#" class="btn btn-default" role="button">�󼼺���</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4 ">
    <div class="thumbnail">
      <img src="/images/uploadFiles/1664288_1.jpg"  width="300" height="300">
      <div class="caption">
        <h3>�Ǹŷ� 1�� ��ǰ</h3>
        <p>�̰Źٸ��� ��ģ�̻����� ���ɴ� �������� ��Ų/�μ� </p>
        <p><a href="#" class="btn btn-warning" role="button">�����ϱ�</a> <a href="#" class="btn btn-default" role="button">�󼼺���</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4 ">
    <div class="thumbnail">
      <img src="/images/uploadFiles/20111129000312_0.jpg"  width="300" height="300">
      <div class="caption">
        <h3>�԰�����ǰ</h3>
        <p>���ȴ�...��������� �Ұ��� �Ѹ��ȹ�</p>
        <p><a href="#" class="btn btn-success" role="button">�����ϱ�</a> <a href="#" class="btn btn-default" role="button">�󼼺���</a></p>
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
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>