<%@ include file="header_for_seqdet.jsp"%>
<title>Teams</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery-ui.css" />">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<%-- 21Dec 2016 added for the header and navigation --%>
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<%--END 21Dec 2016 added for the header and navigation --%>
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<%-- END 12 Oct added combogrid jquery libraries--%>
<style type="text/css">	
.navbar-inverse .navbar-nav>li>a {
            color: #767676;
            font-size:14px;
            border:2px solid #e7f4c1;
            padding:10px 5px;
        }
        .navbar-inverse .navbar-nav>li>a:hover{
            color: #6b8f00;
            border:1px solid #98bf21;
            background-color:#f1f1f1;
            transition: all 0.3s ease 0s;
        }	
.bubble{
    background-color: green;
    border-radius: 5px;
    box-shadow: 0px 0px 6px #B2B2B2;
    height: 10px;
    margin: 10px;
	font: 10px sans-serif; 
	color : yellow;
	text-align: center;
}
.tooltip {
    text-decoration:none;
    position:relative;
}
.tooltip span {
    display:none;
}
.tooltip:hover span {
    display:block;
    position:fixed;
    overflow:hidden;
    background-color:yellow;
    font-family:Arial;
 font-size:8pt;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#tool_tip").hide();

	$("#tool_tip")
	.fadeIn(9000);
	
	var tooltips = document.querySelectorAll('.tooltip span');

	window.onmousemove = function (e) {
	    var x = (e.clientX + 20) + 'px',
	        y = (e.clientY + 20) + 'px';
	    for (var i = 0; i < tooltips.length; i++) {
	        tooltips[i].style.top = y;
	        tooltips[i].style.left = x;
	    }
	};

});
$("#team_name_param").combogrid({
	url: 'SearchTeams.htm?system_type_param='+$("#system_type_param").val()+'&action_param=search_with_properties_only',
	colModel: [
	           {'columnName':'teamId','width':'0','label':''},
	           {'columnName':'teamName','width':'50','label':'Team'},
	           {'columnName':'teamDescription','width':'0','label':''}
	           ],
	select: function( event, ui ) {


	$("#team_name_param").val(ui.item.teamName);
	document.getElementById('team_id_param').value=ui.item.teamId;
	
	return false;
	}
	});
});
</script>	
<script type="text/javascript">
	function addLi(accessText, teamId, access)
	{
		if(access=='RO'){
			accessText+=" - Read Only Access";
		}else if(access=='RW'){
			accessText+=" - Read Write Access";
		}else if(access=='OW'){
			accessText+=" - Owner Access";
		}
		document.getElementById('team_name_param').value="";
//		$("#div_id ul").append('<li><span class="tab">Message Center</span></li>');		
		$("#div_id ul").append('<li id="li_'+teamId+'" style="padding-left:10px"><a href="#" onclick="parentNode.parentNode.removeChild(parentNode)"> '+accessText+'<input type="hidden" name="team_'+teamId+'" value="team_'+teamId+'_'+access+'" /> </a></li>');
	}
</script>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#md-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="/">
<img src="images/logo.png" alt="qSequence logo" class="img-responsive">
</a>
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="md-navbar-collapse-1">
<ul class="nav navbar-nav navbar-right">
<c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
<li>
<a href="<c:url value="/Dashboard.htm" />">Home</a>
</li>
<li>
<a href="<c:url value="/Login.htm" />">Login</a>
</li>
</c:if>
<c:if test="${modelUc.loginSuccessful=='SUCCESSFUL'}">
<li>
<a href="<c:url value="/Dashboard.htm" />">Home</a>
</li>
<li>
<a href="<c:url value="/Profile.htm" />">Profile</a>
</li>
<c:if test="${modelUc.role=='ADMIN' or modelUc.role=='ENTERPRISE_ARCHITECT' }">
	<li>
	<a href="<c:url value="/Admin.htm" />">Admin</a>
	</li>
</c:if>
<li>
<a href="<c:url value="/Logout.htm" />">Logout</a>
</li>
</c:if>
</ul>
</div>
<!-- /.navbar-collapse -->
</nav>
<div id="container">

<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/MyMenu.htm?seq_mst_id_param=${modelUc.seq_mst_id_param}&message=${modelUc.message}&error=${modelUc.error}"/>
</c:if>


<table align="center" border="0" width=600>
<tr><td>
<form id="subscription_order_form" action="Team.htm" method="post"  >
	
	<table align="center" border="0" width=600>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
		<tr><td style="text-align:left;"><h1>Teams</h1></td><td style="text-align:right;">&nbsp;<input type="hidden" name="user_request_action_param" value="save_action" maxlength="20"/></td></tr>
		
        <tr style="height:50px;text-align:left;"><td ><label>Team name </label> <input type="text" name="team_name_param" value="${modelUc.team.teamName}" maxlength="200"/><input type="hidden" name="team_id_param" value="${modelUc.team.id}" /></td><td><label>Description </label> <input type="text" name="team_description_param" value="${modelUc.team.teamDescription}" /><input type="submit" value="Save" />
</td></tr>
       
		<tr><td colspan="2">
			<div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
		<div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
		</td></tr>	
		
		</table>
		<c:set var="x" value="0" />
        	<table align="center" width="700">
			<c:if test="${modelUc.teamsList[0]!=null}">
        		
         		<c:forEach items='${modelUc.teamsList}' var="team">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="Team.htm?user_request_action_param=edit_action&team_id_param=${team.id}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${team.teamDescription}">${team.teamName}</a>
					</td>

					<td align="center"><a href="<c:url value="Team.htm?user_request_action_param=delete_action&team_id_param=${team.id}"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${team.id}'  src="images/delete.png"/></a></td>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="Team.htm?user_request_action_param=edit_action&team_id_param=${team.id}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${team.teamDescription}">${team.teamName}</a>
					</td>
					
					<td align="center">
						<a href="<c:url value="Team.htm?user_request_action_param=delete_action&team_id_param=${team.id}"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${team.id}'  src="images/delete.png"/></a></td>
					</td>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		</table>

</form>
</td></tr>
<tr><td>
</td></tr>
</table>
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 				
<%@ include file="footer.jsp"%>
