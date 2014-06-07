$( document ).ready(function() {
  $( "#expence_group_id" ).change(function() {
  	var group_id = $("#expence_group_id").val();
    $.ajax({
      url: "/expences/load_users?id="+group_id,
      }).success(function(data) {
        $("#user_list").html(data);
      });
  });
    
});

function onSelectUser(ID)
{
  name = $(ID).attr("id").split("_")[2];
  if($(ID).is(':checked'))
  {
  	$("#amount_user_"+name).prop("disabled", false);
  }
  else
  {
  	$("#amount_user_"+name).prop("disabled", true);
  } 	
}


