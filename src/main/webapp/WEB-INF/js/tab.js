
$(function(){
    $("dt").click(function(){
      $(this).toggleClass("open");
      if($(this).hasClass("open"))
        $("dt").not(this).removeClass("open");
    })
})

// $(function(){
//     $('.tab-button').click(function (e) {
        
//         $(this).toggleClass('open').next().slideToggle(300);
//     });
// });
    // $('.tab-button').on('click',function(){
    //     $('.tab-button').removeClass('on');
    //     $(this).addClass('on')
    // });

    // $('.tab-button').click(function (e) {
    //     if ($(this).hasClass('open')) {
    //         $('.tab-button').removeClass('open');
    //     }else{
    //         $('.tab-button').removeClass('open');
    //         $(this).addClass('open');
    //     }
    
    // e.stopPropagation();
    // e.preventDefault();
    // });
// var tab = (function() {

// 	function init() {
		
// 		//nav
// 		[].slice.call( document.querySelectorAll( '.main-menu' ) ).forEach( function( element, i ) {
			
// 			//클래스 이름, 태그 갖고오기(querySelector)
// 			//순서대로
// 			var btn = element.querySelector( 'tab-button' ),
// 				open = false;
				
// 			//여러개의 이벤트 핸들러 등록 (addEventListener) 복수의 동일 이벤트 타입 리스너를 등록
// 			btn.addEventListener( 'click', function( event ) { //tab-button 클릭시 이벤트
// 				if( !open ) {
// 					element.className += 'menu-open';
// 					open = true;
// 				}
// 			}, false );

// 			icon.addEventListener( 'click', function( event ) {
// 				if( open ) {
// 					event.stopPropagation();
// 					open = false;
// 					element.className = element.className.replace(/\bmenu-open\b/, '');
// 					//dr-menu-open 일치하는 글자가 있으면 삭제
// 					return false;
// 				}
// 			}, false );

// 		} );

// 	}

// 	init();
// 	//초기화 후 계속 사용
// })();