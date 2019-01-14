<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath }" var="path"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>example</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.js"></script>
    <link rel="stylesheet" type="text/css" href="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.css" />
</head>
<body>
<div id="main" style="width: 100%; height: 400px;"></div>
</body>

<script>

var data=${items};
var config = {
	    layout: {
	        name: 'layout',
	        padding: 4,
	        panels: [
	            { type: 'left', size: '50%', resizable: true, minSize: 300 },
	            { type: 'main', minSize: 300 }
	        ]
	    },
	    grid: { 
	        name: 'grid',
	        show: {
	            toolbar            : true,
	            toolbarDelete    : true
	        },
	        columns: [
	        	 { field: 'ITEMCD', caption: '상품코드', size: '30%', sortable: true, attr: 'align=center' },
	             { field: 'ITEMNAME', caption: '상품명', size: '30%', sortable: true },
	             { field: 'MADENMCD', caption: '제조사코드', size: '30%', sortable: true },
	             { field: 'MADENAME', caption: '제조사명', size: '40%' },
	             { field: 'ITEMUNITCD', caption: '단위코드', size: '30%' },
	             { field: 'UNITNAME', caption: '단위명', size: '30%' },
	             { field: 'STOCKAMT', caption: '재고수량', size: '30%' },
	             { field: 'STOCKYN', caption: '재고여부', size: '30%', sortable: true, resizable: false, style: 'text-align: center',
	                 editable: { type: 'checkbox', style: 'text-align: center' } 
	             },
	             { field: 'USEYN', caption: '사용여부', size: '60px', sortable: true, resizable: false, style: 'text-align: center',
	                 editable: { type: 'checkbox', style: 'text-align: center' } 
	             }
	        ],
	        records:data,
	        total:data.length,
	        onClick: function(event) {
	            var grid = this;
	            var form = w2ui.form;
	            console.log(event);
	            event.onComplete = function () {
	            	$("#INSAMT").attr("readonly","readonly");
	                var sel = grid.getSelection();
	                console.log(sel);
	                if (sel.length == 1) {
	                    form.recid  = sel[0];
	                    form.record = $.extend(true, {}, grid.get(sel[0]));
	                    form.refresh();
	                } else {
	                    form.clear();
	                }
	            }
	        }
	    },
	    form: { 
	        header: 'Edit Record',
	        name: 'form',
	        fields: [
	            { name: 'recid', type: 'text', html: { caption: '상품코드 : ', attr: 'size="10" readonly' } },
	            { name: 'ITEMCD', type: 'text',  html: { caption: '상품명 : ', attr: 'size="40" maxlength="40" readonly' } },
	            { name: 'ITEMNAME', type: 'text', html: { caption: '제조사 : ', attr: 'size="40" maxlength="40" readonly' } },
	            { name: 'UNITNAME', type: 'text', html: { caption: '단위명 : ', attr: 'size="40" maxlength="40" readonly' } },
	            { name: 'INSAMT', type: 'number', html: { caption: '입고수량 : ', attr: 'size="40" maxlength="40" readonly' } },
	        ],
	        actions: {
	            	수정: function () {
	                $("#INSAMT").removeAttr("readonly");
	            },
	            Save: function () {
	            	var itemcd=$("#ITEMCD").val().trim();
	            	var insamt=$("#INSAMT").val().trim();
	            	if(insamt.length>0&&itemcd.length>0)
            		{
	            		$.ajax({
	  	            	  url:"${path}/item/uiItemInsert",
	  	            	  data:{itemcd:itemcd,insamt:insamt},
	  	            	  dataType:"json",
	  	            	  success:function(data)
	  	            	  {
	  	            		  
	  	            		 alert("입고완료");
	  						
	  						w2ui.layout.get('left').content.clear();
	  						
	  						w2ui.layout.get('left').content.add(data);
	  	            	  }	
	  	               });
            		}
	            	else
            		{
	            		alert("코드선택 -> 수정 -> 저장 순서");
            		}
	               
	            }
	        }
	    }
	};

	$(function () {
	    // initialization
	    $('#main').w2layout(config.layout);
	    w2ui.layout.content('left', $().w2grid(config.grid));
	    w2ui.layout.content('main', $().w2form(config.form));
	});

</script>
</html>