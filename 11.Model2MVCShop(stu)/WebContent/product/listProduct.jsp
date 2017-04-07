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

	$("#currentPage").val(currentPage)

	console.log( "/product/listProduct?menu=${param.menu}");
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
}
$(function() {
	
	 $( "button.btn.btn-default" ).on("click" , function() {
		 
		fncGetAllList(1);
	});
	//update
	 $("td span.getProduct").on("click", function(){
			//salert("detail");
			var prodNo=$(this).attr('prodNo').trim();
			var menu=$(this).attr('menu').trim();
			self.location="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
			});
	 
	$("td span i").hover( function() {
		
		var prodNo=$(this).attr('prodNo');
		var menu=$(this).attr('menu');
		$.ajax( 
			{
				url : "/product/getJsonProduct/"+prodNo+"/"+menu,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					$(document).on("click", '#update', function(){
					//	alert("update");

						var prodNo=JSONData.product.prodNo;
						self.location="/product/updateProduct?prodNo="+prodNo;
						});
						//상세보기
						$(document).on("click", '#detail', function(){
							//alert("detail");
							var prodNo=JSONData.product.prodNo;
							var menu=$(".ct_list_pop td:nth-child(3) span").attr('sendValue2').trim();
							self.location="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
							});
					
					var displayValue = "<h3>"
								+"상품번호 : "+JSONData.product.prodNo+"<br/>"
								+"상품명: "+JSONData.product.prodName+"<br/>"
								+"상품이미지 : "+JSONData.product.fileName+"<br/>"
								+"상품상세정보 : "+JSONData.product.prodDetail+"<br/>"
								+"제조일자 :"+JSONData.product.manuDate+"<br/>"
								+"가격 :"+JSONData.product.price+"<br/>"
								+"등록일자 :"+JSONData.product.regDate+"<br/>";
								if (menu=="manage"){
								displayValue+="<input id='update' type='button' value='수정'/>";
								}
								if (menu=="search"){
									displayValue+="<input id='detail' type='button' value='상세보기'/>";
									}
								
								displayValue+="</h3>";
								
				
				$("h3").remove();
				$( "#"+prodNo+"" ).html(displayValue);
				}
		
			});
		
	});
	
	 $( "td span:contains('배송하기')" ).css("color","orange");
	
	$( "td span:contains('배송하기')" ).on("click" , function() {
		//Debug..
		//alert(  $(this).attr('prodNo') );
		//alert(  $(this).attr('proTranCode') );
		
		self.location ="/purchase/updateTranCodeByProd?prodNo="+$(this).attr('prodNo')+"&tranCode="+$(this).attr('proTranCode');
	});
	
		//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
	$( "td span.getProduct" ).css("color" , "blue");
				
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
		<c:if test="${param.menu=='manage' }">
	       <h3>상품관리</h3>
	    </c:if>
	    <c:if test="${param.menu !='manage' }">
	       <h3>상품 목록</h3>
	    </c:if>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
		    <select class="form-control" name="searchCondition" >
			 <option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
			 <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
			 <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
			</select>
		</div>
				  
		<div class="form-group">
		   <label class="sr-only" for="searchKeyword">검색어</label>
		   <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
		   			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
		</div>
				  
		  <button type="button" class="btn btn-default">검색</button>
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>

      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">판매현황</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			<td align="center">${ i }</td>
			
			 <td align="left"  title="Click : 상품정보 확인">
			 
			 <span class="getProduct" prodNo="${product.prodNo}" menu=${param.menu } >
			 <c:if test="${product.proTranCode=='0'}">
			      <img src="/images/uploadFiles/${product.fileName}" width="50" />
				 ${product.prodName}
          		 </c:if> 
          		 <c:if test="${product.proTranCode!='0'}">
       	 		 ${product.prodName}
       			</c:if>
       			</span>
			 </td>
		
			  <td align="left">${product.price}</td>
			  <td align="left">${product.regDate}</td>
			  <td align="left">
			  <c:if test="${param.menu=='search' }">
			  	<c:choose>
			  	  <c:when test="${product.proTranCode.trim()=='0'}">
			  	    판매중
			  	  </c:when>
			  	  <c:otherwise>
			  	    재고없음    
			   	  </c:otherwise>
			   </c:choose>
			  </c:if>
			  <span class="prodStatus" prodNo="${product.prodNo}" proTranCode="${product.proTranCode}">
				<c:if test="${param.menu=='manage'}">
				  <c:choose>
					<c:when test="${product.proTranCode.trim()=='0' }">
             		판매중
					</c:when>
					<c:when test="${product.proTranCode.trim()=='1' }">
               		 구매완료
                   	 배송하기
					</c:when>
					<c:when test="${product.proTranCode.trim()=='2' }">
                  	 배송중
                    </c:when>
					<c:when test="${product.proTranCode.trim()=='3' }">
                   	 배송완료
       	            </c:when>
				 </c:choose>		
			    </c:if>
			  </span>
			  </td>
			  <td align="left"  title="Click : 상품간략정보보기"   >
			   <span class="getProductSm">
		   <i class="glyphicon glyphicon-ok" prodNo="${product.prodNo}" menu="${ param.menu }" id= "${product.prodNo}" ></i>
			 </span>
		</td>
			  <!-- <td  colspan="11" bgcolor="D6D7D6" height="1"></td> -->
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
