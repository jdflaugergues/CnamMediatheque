var upAndDow = function(id){

	if ($('#btn'+id).attr('class') == 'glyphicon glyphicon-menu-down'){
		$('#code'+id).fadeOut();
		$('#btn'+id).attr('class', 'glyphicon glyphicon-menu-up');}
	else{
		$('#code'+id).fadeIn();
		$('#btn'+id).attr('class', 'glyphicon glyphicon-menu-down');
	}
}