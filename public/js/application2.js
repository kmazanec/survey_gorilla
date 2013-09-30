

// ============= DOCUMENT READY ================================= //

$(document).ready(function() {
  var names = $('#qname').text()
  var name_array = []


  $.post('/fetch_names',{data:names},function(response){
    jQuery.each(response,function(i,val){
      name_array.push(val);
    })   
  });


  var name_array = []

  $.post('/fetch_results',{data:names},function(response){
    var hats = []
    jQuery.each(response,function(i, val) {
      hats.push([ Math.floor(i),val])
    });


    var data = [];
    var n = -1;
    jQuery.each(hats,function(){
      n++;
      data.push({ label: name_array[n], data:[this], bars:{show:true, barWidth:0.5}});
    });
    $.plot($("#ph"), data, {})
  });
});
  // var data = [{ label: "", data:[[1, 3], [2, 12.01], [0.5, 3.14],[12,12]] , bars:{show:true, barWidth:0.5}} ];
  // $.plot($("#ph"), data, {})
