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
    <script type="text/javascript" src="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.min.css" />
</head>
<body>
	<div id="grid" style="width: 100%; height: 250px;"></div>
</body>
<script>

$(function () {
	/* {
	    "total": 9,
	    "records": [
	        { "recid": 1, "fname": "John", "lname": "Doe", "email": "jdoe@gmail.com", "sdate": "4/3/2012" },
	        { "recid": 2, "fname": "Stuart", "lname": "Motzart", "email": "jdoe@gmail.com", "sdate": "4/3/2012" },
	        { "recid": 3, "fname": "Jin", "lname": "Franson", "email": "jdoe@gmail.com", "sdate": "4/3/2012" },
	        { "recid": 4, "fname": "Susan", "lname": "Ottie", "email": "jdoe@gmail.com", "sdate": "4/3/2012" },
	        { "recid": 5, "fname": "Kelly", "lname": "Silver", "email": "jdoe@gmail.com", "sdate": "4/3/2012" },
	        { "recid": 6, "fname": "Francis", "lname": "Gatos", "email": "jdoe@gmail.com", "sdate": "4/3/2012" },
	        { "recid": 7, "fname": "Mark", "lname": "Welldo", "email": "jdoe@gmail.com", "sdate": "4/3/2012" },
	        { "recid": 8, "fname": "Thomas", "lname": "Bahh", "email": "jdoe@gmail.com", "sdate": "4/3/2012" },
	        { "recid": 9, "fname": "Sergei", "lname": "Rachmaninov", "email": "jdoe@gmail.com", "sdate": "4/3/2012" }
	    ]
	} */
	
	var data=${empList};
	console.log(data);
	console.log(data.length);
    $('#grid').w2grid({ 
        name: 'grid', 
        columns: [                
            { field: 'ENAME', caption: '사원명',size :'30%'  },
            { field: 'COMM', caption: 'comm',size :'20%'  },
            { field: 'HIREDATE', caption: '고용일',size :'30%' },
            { field: 'EMPNO', caption: '사원번호',size :'20%'  },
            { field: 'MGR', caption: '매니저번호',size :'20%'  },
            { field: 'JOB', caption: 'job',size :'20%'  },
            { field: 'DEPTNO', caption: '부서번호',size :'20%'  },
            { field: 'SAL', caption: '급여',size :'20%'  }
        ],
        records:data,
        total:data.length
        
    });     
})


</script>
</html>