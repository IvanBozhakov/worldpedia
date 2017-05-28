$(document).ready(function(){
	$('.tab').click(function(){
		setActiveTab(this);
	});
});

function setActiveTab(self){
	$('.tab').removeClass('active');
	$(self).addClass('active');
	$('.profile-content').hide();
	
	if($(self).hasClass('settings')){
		$('.tab-setings').show();
	}else if($(self).hasClass('favorites')){
		$('.tab-favorites').show();
	}else if($(self).hasClass('followers')){
		$('.tab-followers').show();
	}
}