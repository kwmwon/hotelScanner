<%@page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />       
        <title>jQuery UI</title>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3.3.2/css/bootstrap.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
         <!-- datepicker 한국어로 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
        <style>
          div #fromDate, #toDate {
          	width: 200px;
          }
          div#checkCal_fDate {
          	float: left;
          	position: relative;

          }
          div#checkCal_tDate {
          	float: left;
          	position: relative;
          	left: 10px;
          }
        </style> 
        <script>
            $(function() {
            	var fromDate = document.getElementById("fromDate");
            	var toDate = document.getElementById("toDate");
                //오늘 날짜를 출력
                $("#today").text(new Date().toLocaleDateString());
                $.datepicker.regional['ko']= {
                        closeText:'닫기',
                        prevText:'이전달',
                        nextText:'다음달',
                        currentText:'오늘',
                        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                        monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                        dayNames:['일','월','화','수','목','금','토'],
                        dayNamesShort:['일','월','화','수','목','금','토'],
                        dayNamesMin:['일','월','화','수','목','금','토']};
                //datepicker 한국어로 사용하기 위한 언어설정
                $.datepicker.setDefaults($.datepicker.regional['ko']); 
                // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
                //시작일.
                $('#fromDate').datepicker({
                    dateFormat: "yy-mm-dd", // 날짜의 형식
                    minDate: 0,  // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {    
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정        	
                        	if(isNull(toDate.value)){
                        		$('#toDate').datepicker( "option", "minDate", selectedDate );
                        		$('#toDate').focus();	
                        	} else 
                        		$('#toDate').datepicker( "option", "minDate", selectedDate ); 
                        			
                    }                
                });
                //종료일
                $('#toDate').datepicker({
                    dateFormat: "yy-mm-dd",
                    minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) { // 종료일(toDate) datepicker가 닫힐때
                   	 if(isNull(fromDate.value)){
            	        	$('#fromDate').datepicker( "option", "maxDate", selectedDate );
           		         	$('#fromDate').focus();
            	        } else
                    	 	// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                 	      	$('#fromDate').datepicker( "option", "maxDate", selectedDate );
                    }                
                });
            });
            function isNull(obj) {
            	return (typeof obj != "undefined" && obj != null && obj != "") ? false : true;
            }
        </script>
    </head>
    <body>
			<div id="checkCal_fDate" >
				<label class="control-label" for="fromDate">체크인 </label>
				<input type="text" class="form-control" name="fromDate" id="fromDate" />
			</div>
			<div id="checkCal_tDate" >
				<label class="control-label" for="toDate">체크아웃 </label>
				<input type="text" class="form-control" name="toDate" id="toDate" />
			</div>
    </body>
</html>