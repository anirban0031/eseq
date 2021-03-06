<%@ include file="header_for_seqdet.jsp"%>
    <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="jquery/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
        <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
    
<title>Sequence List</title>
<style>
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
    height: 20px;
    margin:30px 0 0 750px;
	font: 16px/25px sans-serif; 
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
</head>
<body>


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

function updateSeqMst( user_request_action_param, social_network_param, seq_mst_id_param, url) { 

$("#img_"+seq_mst_id_param).attr('src',"images/secure-link-image.png");
$("#img_"+seq_mst_id_param).attr('title',"Secure your shared link");
$("#img_"+seq_mst_id_param).attr('alt',"Secure your shared link");

		$.post(url,
				{
					user_request_action_param:user_request_action_param,
					seq_mst_id_param:seq_mst_id_param,
					social_network_param:social_network_param
				},
				function(data,status){
					
				});
	}
</script>
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


<!--<div style="left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6;height:100px ">-->
<c:if test="${modelUc.status=='saved'}">
<c:redirect url="/ChangeReleaseList.htm?user_request_action_param=retrieve_release&saveError=${modelUc.saveError}&seqMstIds=${modelUc.seqMstIds}&sysSeqIds=${modelUc.sysSeqIds}&consolidatedSysSeqIds=${modelUc.consolidatedSysSeqIds}&sequenceVersion=${modelUc.sequenceVersion}"/>
</c:if>
<c:if test="${modelUc.status=='pushed_to_development'}">
<c:redirect url="/ChangeReleaseList.htm?message=Successfully released sequence to development."/>
</c:if>
<c:if test="${modelUc.status=='pushed_to_production'}">
<c:redirect url="/ChangeReleaseList.htm?message=Successfully released sequence to production."/>
</c:if>
<c:if test="${modelUc.toolTip=='CREATE_SEQUENCE_TIP'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Enter name of the sequence & click the create sequence button, check <a href="<c:url value="faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a></div>
</c:if>
<c:if test="${modelUc.toolTip=='FIRST_SEQUENCE_SAVE'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Click on the sequence name to get started, check <a href="<c:url value="faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a></div>
</c:if>
<c:if test="${modelUc.toolTip=='ADD_SEQUENCE_DESC'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Click on   <img id="img1"  src="images/yellow_+_button.png"/>   to add description to the sequence</div>
</c:if>
        <form id="release_form" action="ModifiedSequenceList.htm" method="post" >
        <input type="hidden" name="user_request_action_param" value="generate_release" />
        <input type="hidden" name="sequenceVersion" value="${modelUc.sequenceVersion}" />
		<table align="center">
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>
				<table align="center" border="0" width=600>
					
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr><td style="text-align:center;"><h1>Release Sequences</h1></td><td style="text-align:right;"><!-- <a href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${modelUc.seq_mst_id_param}"/>">&lt;&lt;&nbsp;Back</a> -->&nbsp;</td></tr>
					<c:if test="${modelUc.message=='' or modelUc.message==null}">
	        			<tr style="height:50px;text-align:center;"><td colspan="2" ><label>Select from the below list of sequences </label> <button id="release" type="button" onclick="document.getElementById('release_form').submit();">Release</button><br>
						</td></tr>
					</c:if>
					<tr><td colspan="2">
						<div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
						<div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
					</td></tr>	
				</table>
			</td></tr>
			<!-- 
		<tr><td>

	        <form action="ReleaseChangedSequenceList.htm" method="post" >
	        	<table>
					
	        		<tr><td><label for="sequenceName">Sequence Name</label></td>
					<td>
	            		<input id="sequenceName" name="sequenceName" type="text" maxlength="100" />
	            		<input id="number_of_sequences_param" name="number_of_sequences_param" type="hidden" value="${modelUc.numberOfSequences}" />
	            		<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_sequence_action" />
	                </td><td><input type="submit" src="/images/login.png" value="Create Sequence"></td></tr>
	        		<tr>
	        		<td colspan="3"><font color="red">${modelUc.sequenceSaveError}
	        		<c:if test="${modelUc.displayUpgradeProductLink=='true'}">
	        			&nbsp;At the moment we provide the indicated number of sequences online. Contact us if you have any questions.
	        		</c:if>
	        		<c:if test="${modelUc.buyEnterpriseVersionLink=='true'}">
	        			&nbsp;Send email to admin@qsequence.com
	        		</c:if>
	
	        		</font>
	        		</td></tr>
					<tr><td colspan="3">&nbsp;</td></tr>
	        	</table>
	        </form>

        </td>
		</tr>
		 -->
        <tr><td>

		<c:set var="x" value="0" />
        	<table align="center" width="900">
        		<c:if test="${modelUc.userRequestAction=='draft_release'}">
	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="${modelUc.grayShade}" width="100%" ><label for="sequenceName">Draft sequences</label></td></tr>
	         		<tr height="50px"><th  bgcolor="${modelUc.greenShade}" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="${modelUc.greenShade}"><label for="createdDate">Change Label</label></th><th  bgcolor="${modelUc.greenShade}"><label for="createdDate">Created Date</label></th><th  bgcolor="${modelUc.greenShade}"><label for="release">Release</label></th></tr>

         			<c:if test="${modelUc.ucSeqMstDraftList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red"><strong>No draft sequences found.</strong></font>
						</td>
						</tr>
         			</c:if>
				</c:if>
        	<c:if test="${modelUc.ucSeqMstDraftList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSeqMstDraftList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td>
						<c:if test="${seqMst.selectedForRelease=='Y'}">
							<input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" checked value="${seqMst.seqMstId}">
						</c:if>
						<c:if test="${seqMst.selectedForRelease!='Y'}">
							<input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" value="${seqMst.seqMstId}">
						</c:if>
					</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td class="bottom seq-margin yellow-tooltip"  align="center"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}				
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" />
					</td>
					<td>
						<c:if test="${seqMst.selectedForRelease=='Y'}">
							<input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" checked value="${seqMst.seqMstId}">
						</c:if>
						<c:if test="${seqMst.selectedForRelease!='Y'}">
							<input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" value="${seqMst.seqMstId}">
						</c:if>
					</td>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		<!-- =================DRAFT System sequence ========================= -->
        		<c:if test="${modelUc.userRequestAction=='draft_release'}">
	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="${modelUc.grayShade}" width="100%" ><label for="sequenceName">Draft system sequences</label></td></tr>
	         		<tr height="50px"><th  bgcolor="${modelUc.greenShade}" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="${modelUc.greenShade}">
	         		<label for="createdDate">Change Label</label></th><th  bgcolor="${modelUc.greenShade}"><label for="createdDate">Created Date</label></th><th  bgcolor="${modelUc.greenShade}"><label for="release">Release</label></th></tr>

         			<c:if test="${modelUc.ucSysSeqMstDraftList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red"><strong>No draft system sequences found.</strong></font>
						</td>
						</tr>
         			</c:if>
				</c:if>
        		<c:if test="${modelUc.ucSysSeqMstDraftList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSysSeqMstDraftList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td class="bottom seq-margin yellow-tooltip"  align="center"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeTitle}">${seqMst.changeNote}
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td>
						<c:if test="${seqMst.selectedForRelease=='Y'}">
							<input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" checked value="${seqMst.sysSeqId}">
						</c:if>
						<c:if test="${seqMst.selectedForRelease!='Y'}">
							<input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" value="${seqMst.sysSeqId}">
						</c:if>
					</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td class="bottom seq-margin yellow-tooltip"  align="center"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td>
						<c:if test="${seqMst.selectedForRelease=='Y'}">
							<input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" checked value="${seqMst.sysSeqId}">
						</c:if>
						<c:if test="${seqMst.selectedForRelease!='Y'}">
							<input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" value="${seqMst.sysSeqId}">
						</c:if>
					</td>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		<!-- ***********************DEV RELEASE *************************************** -->
        		<c:if test="${modelUc.userRequestAction=='dev_release'}">
	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="${modelUc.grayShade}" width="100%" ><label for="sequenceName">Development sequences</label></td></tr>
	         		<tr height="50px"><th  bgcolor="${modelUc.greenShade}" width="50%" ><label for="sequenceName">Sequence Name</label></th>
	         		<th  bgcolor="${modelUc.greenShade}"><label for="createdDate">Change Label</label></th><th  bgcolor="${modelUc.greenShade}">
	         		<label for="createdDate">Created Date</label></th><th  bgcolor="${modelUc.greenShade}"><label for="release">Release</label></th></tr>

         			<c:if test="${modelUc.ucSeqMstList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red"><strong>No sequences found.</strong></font>
						</td>
						</tr>
         			</c:if>
				</c:if>
        		<c:if test="${modelUc.ucSeqMstList[0]!=null}">
         		<c:forEach items='${modelUc.ucSeqMstList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td>
						<c:if test="${seqMst.selectedForRelease=='Y'}">
							<input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" checked value="${seqMst.seqMstId}">
						</c:if>
						<c:if test="${seqMst.selectedForRelease!='Y'}">
							<input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" value="${seqMst.seqMstId}">
						</c:if>
					</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td>
						<c:if test="${seqMst.selectedForRelease=='Y'}">
							<input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" checked value="${seqMst.seqMstId}">
						</c:if>
						<c:if test="${seqMst.selectedForRelease!='Y'}">
							<input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" value="${seqMst.seqMstId}">
						</c:if>
					</td>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>     
        		</c:if>  
		<!-- =================DEV System sequence ========================= -->
        		<c:if test="${modelUc.userRequestAction=='dev_release'}">
	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="${modelUc.grayShade}" width="100%" ><label for="sequenceName">Development system sequences</label></td></tr>
	         		<tr height="50px"><th  bgcolor="${modelUc.greenShade}" width="50%" ><label for="sequenceName">Sequence Name</label></th>
	         		<th  bgcolor="${modelUc.greenShade}"><label for="createdDate">Change Label</label></th><th  bgcolor="${modelUc.greenShade}">
	         		<label for="createdDate">Created Date</label></th><th  bgcolor="${modelUc.greenShade}"><label for="release">Release</label></th></tr>

         			<c:if test="${modelUc.ucSysSeqMstList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red"><strong>No development system sequences found.</strong></font>
						</td>
						</tr>
         			</c:if>
				</c:if>
        		<c:if test="${modelUc.ucSysSeqMstList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSysSeqMstList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td>
						<c:if test="${seqMst.selectedForRelease=='Y'}">
							<input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" checked value="${seqMst.sysSeqId}">
						</c:if>
						<c:if test="${seqMst.selectedForRelease!='Y'}">
							<input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" value="${seqMst.sysSeqId}">
						</c:if>
					</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td>
						<c:if test="${seqMst.selectedForRelease=='Y'}">
							<input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" checked value="${seqMst.sysSeqId}">
						</c:if>
						<c:if test="${seqMst.selectedForRelease!='Y'}">
							<input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" value="${seqMst.sysSeqId}">
						</c:if>
					</td>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
			       		
        	</table>
       </td>
       </tr> 
	</table>
	</form>
		<script type= "text/javascript" src="jquery/bootstrap.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        $('a').tooltip();
	    });
	</script>
	<br/><br/><br/><br/><br/>
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
