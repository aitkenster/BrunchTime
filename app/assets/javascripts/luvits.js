$(document).ready(function(){
	$('.luvit-link').on('click', function(event){
		event.preventDefault();
		var countId = $(this).siblings('.luvit_count').find('span')
		
		$.post(this.href, function(response) {
			$(countId).text(response.new_luvits_count);
		});
	})
})
