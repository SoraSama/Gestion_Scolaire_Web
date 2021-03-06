<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!doctype html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>Export to PDF</title>
</head>
		 <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" >
		 <link href="${pageContext.request.contextPath}/resources/css/dhtmlxscheduler.css" rel="stylesheet" charset="utf-8" />
	     <script src= "${pageContext.request.contextPath}/resources/js/dhtmlxscheduler.js" charset="utf-8"></script>	 
	     <script src="${pageContext.request.contextPath}/resources/js/dhtmlxscheduler_year_view.js" charset="utf-8"></script>
	     <script src="${pageContext.request.contextPath}/resources/js/dhtmlxscheduler_agenda_view.js" charset="utf-8"></script>
	     <script src="${pageContext.request.contextPath}/resources/js/dhtmlxscheduler_pdf.js" type="text/javascript" charset="utf-8"></script>
		
		 <script src="${pageContext.request.contextPath}/resources/js/dhtmlxscheduler_serialize.js"></script>
		 <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	
<style type="text/css" >
	html, body{
		margin:0px;
		padding:0px;
		height:100%;
		overflow:hidden;
	}	
</style>

<script type="text/javascript" charset="utf-8">
	function init() {
		scheduler.config.xml_date="%Y-%m-%d %H:%i";
		scheduler.init('scheduler_here',new Date(2017,08,18),"month");
		//scheduler.load("${pageContext.request.contextPath}/resources/data/events.xml");
		
	}
	
</script>
<script type="text/javascript" charset="utf-8">
	function print(){
		var json_string = scheduler.toJSON(); //json string
		console.log(json_string);
		var evs = scheduler.getEvents();		
		$.ajax({
		    url: '/GestionScolaireWeb/calendar/json',
		    type: 'get',
		    data: JSON.stringify(json_string),
		    contentType: 'application/json; charset=utf-8',
		    dataType: 'json',
		    async: false,
		    success: function(msg) {
		        console.log(msg);
		     
		    }
		});
		}
	</script>	
<body onload="init();">
	<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
		<div class="dhx_cal_navline">
            <div class='dhx_cal_export pdf' id='export_pdf' title='Export to PDF' onclick='scheduler.toPDF("http://dhtmlxscheduler.appspot.com/export/pdf", "color")'>&nbsp;</div>
           
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			

			<div style="right:780px;"><button type="button" onclick = "print()" class="btn btn-primary btn-circle"><i class="glyphicon glyphicon-floppy-disk"></i></button></div>
			<div class="dhx_cal_tab" name="year_tab" style="right:330px;"></div>
			<div class="dhx_cal_tab" name="agenda_tab" style="right:265px;"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
		</div>
		<div class="dhx_cal_header">
		</div>
		<div class="dhx_cal_data">
		</div>		
	</div>
	
</body>
