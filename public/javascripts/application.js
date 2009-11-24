jQuery.ajaxSetup({  
    'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript"); }  
});


$(function() {
    $('#tier1').data('limit', 5).data('count',0).data('points', 5);
    $('#tier2').data('limit', 10).data('count', 0).data('points', 4);
    $('#tier3').data('limit', 20).data('count', 0).data('points', 3);
	$('#tier4').data('limit', 100).data('count', 0).data('points', 2);
	$('#tier5').data('limit', 100).data('count', 0).data('points', 1);
	$('#tier6').data('limit', 100).data('count', 0).data('points', 0);
  
	var $faculty = $('#faculty');
	$faculty.data('count', 0);

	$('li.draggable').draggable({
		revert: 'invalid', 
		helper: 'clone',
		cursor: 'move',
		start: function(ev, ui) {
			$(this).data('originalDiv', $(this).closest('div.tiers') )
		}
	});

	$('.tiers').droppable({
	    accept: 'li',
	    activeClass: 'ui-state-highlight',
	    drop: function(ev, ui) {
	        var $list = $(this).find('ul:first');
			var limit = $(this).data('limit')
			var c = $(this).data('count');

			if (c < limit) {
				ui.draggable.appendTo($list);
				
				var $count = $(this).find('span.count');
			    $count.text(c + 1);
			    $(this).data('count', c + 1);
			
				var $from_div = $(ui.draggable).data('originalDiv');
				var $from_count = $from_div.find('span.count');
				var old_c = $from_div.data('count');
				$from_count.text(old_c - 1);
				$from_div.data('count', old_c - 1);
			} else {
				return false;
			}

	     }
	  });
	
  	$('#submission').click(function(e) {
		e.preventDefault();
	    var output = [];
		$('.tiers').each(function() {
			var s = [];
			$(this).find('li').find('.id').each(function() {	s.push($(this).text());	});
			output.push( '"' + $(this).data('points') + '":[' + s.join() + ']');
		});
		var data = "{" + output.join() + "}";
		var t = $(this).serialize() + '&submission=' + escape(data);
		var stop = 1;
		
		$.post('/votes', t, function(d) {
			$('#results').text(d.msg)
		}, 'json');
	})

	

});