$(document).ready(function(){
	$('.closeModal').click(function(){
		$(this).parent().addClass('inactive');
		$('.overlay').hide();
	});
});

function toView(id,self){
	var href = $(self).attr("src");
	$('#thumb-'+id).attr("src",href);
}

function showMap(id){
	$('#map-'+id).removeClass('inactive');
	$('.overlay').show();
}

function addComment(self){
	var form = $(self).parent();
	var text = $(form).find('.text').val();
	var user = $(form).find('.user').val();
	var landmark = $(form).find('.landmark').val();
	$.post( "http://localhost:8080/Worldpedia/Comment", { comment: text, user: user , landmark:landmark})
	  .done(function( data ) {
	   $('#section_'+landmark).append(
		"<div class='item-comment'><h4>"+
		'<span class="userpic-menu">'+
		'<img style="display: inline;" src="images/'+data.image+'"  onerror="this.src=\'images/profile.png\'" alt="">'+
		'</span>'
		+"<b><i>"+data.user+"</i> <i class='fa fa-comment' aria-hidden='true'></i></h4></b><div>"+data.text+"</div></div>"	   
	   );
	   $(form).find('.text').val("");
	   $('#section_'+landmark).find('.no-comment').remove();
	});
}

function tag(landmark){
	var comment = "pseudo cooment";
	$.post( "http://localhost:8080/Worldpedia/Tags", { date: now(),
		 landmark:landmark,comment:comment})
	  .done(function( data ) {
		  new Noty({
			  type: 'success',
			  layout: 'topRight',
			  theme: 'mint',
			  text: 'It\'s tagged',
			  timeout: 1000,
			  closeWith: ['click', 'button'],
			  animation: {
			    open: 'noty_effects_open',
			    close: 'noty_effects_close'
			  }
			}).show()
	});
}

function now()
{
  var d = new Date();
  var month = d.getMonth()+1;
  var day = d.getDate();

  var output = (day<10 ? '0' : '') + day + "-" 
              + (month<10 ? '0' : '') + month + '-'
              + d.getFullYear();

  return output;
}

function showTaggedUser(landmark)
{
	
	$.get( "http://localhost:8080/Worldpedia/Tags?landmark="+landmark,function( data ) {
	   //data = JSON.parse(data);
		$('#tagged_'+landmark).html("");
		for(var i in data){
			$('#tagged_'+landmark).append("<li><span class='userpic-menu'>"+
					"<img src='images/"+data[i][1]+"' onerror=\"this.src='imaes/profile.png'\"></span>"+
					data[i][0]+"</li>");
		}
	});
}




