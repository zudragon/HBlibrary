<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
	function input2(){ 
		   $("#menu").append("<option value="+$('#price').val()+">" + $('#pname').val() + "</option>"); 
		  $('#pname').val('');
		  $('#price').val('');
	}
	
	
	function input(){
		  new_op=document.createElement("OPTION");
		  new_op.text=$('#pname').val();
		  new_op.value=$('#price').val();
		  document.frm.menu.add(new_op); 
		  $('#pname').val('');
		  $('#price').val('');
	}
	function clea(){
		  $('#pname').val('');
		  $('#price').val('');
	}
</script>
</head>
<body>
    <form action="" name="frm">
	<fieldset>
	<legend>상품등록</legend>
	
	<label>상품명</label>	
	<input type="text" name="pname" id="pname"><br>
	<label>단 가</label>	
	<input type="text" name="price" id="price"><br>
	<input type="button" value="등록" onclick="input2()">
	<input type="button" value="취소" onclick="clea()">
	</fieldset>
	<div id="div2">
   	<select name="menu" id="menu">
    <option value="">선택</option>
   
   	</select>
   	</div>
   	<input type="submit"  value="전송">
    </form>
</body>
</html>