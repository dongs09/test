(function ($) {
    'use strict';
    /*==================================================================
        [ Daterangepicker ]*/
    try {
    	
//    	//현재 날짜 구하기
//    	var today = new Date();
//    	
//    	var dd = today.getDate();
//    	var mm = today.getMonth()+1;
//    	var yyyy = today.getFullYear();
//    	
//    	if(dd<10) {
//    	    dd='0'+dd
//    	} 
//
//    	if(mm<10) {
//    	    mm='0'+mm
//    	} 
//    	
//    	today = yyyy+'-'+mm+'-'+dd;
    	
        $('.js-datepicker').daterangepicker({
            "singleDatePicker": true,
            "showDropdowns": true,
            "autoUpdateInput": false,
            locale: {
                format: 'YYYY-MM-DD',
            },
//            startDate : '2020-01-01',
//            endDate : today
        });
    
        var myCalendar = $('.js-datepicker');
        var isClick = 0;
    
        $(window).on('click',function(){
            isClick = 0;
        });
    
        $(myCalendar).on('apply.daterangepicker',function(ev, picker){
            isClick = 0;
            $(this).val(picker.startDate.format('YYYY-MM-DD'));
    
        });
    
        $('.js-btn-calendar').on('click',function(e){
            e.stopPropagation();
    
            if(isClick === 1) isClick = 0;
            else if(isClick === 0) isClick = 1;
    
            if (isClick === 1) {
                myCalendar.focus();
            }
        });
    
        $(myCalendar).on('click',function(e){
            e.stopPropagation();
            isClick = 1;
        });
    
        $('.daterangepicker').on('click',function(e){
            e.stopPropagation();
        });
    
    
    } catch(er) {console.log(er);}
    /*[ Select 2 Config ]
        ===========================================================*/
    
    try {
        var selectSimple = $('.js-select-simple');
    
        selectSimple.each(function () {
            var that = $(this);
            var selectBox = that.find('select');
            var selectDropdown = that.find('.select-dropdown');
            selectBox.select2({
                dropdownParent: selectDropdown
            });
        });
    
    } catch (err) {
        console.log(err);
    }
    

})(jQuery);