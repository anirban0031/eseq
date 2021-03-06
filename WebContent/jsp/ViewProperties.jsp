<%@ include file="include.jsp"%>
	<div id="response_prop_menu">
	<table border="0" cellpadding="0" cellspacing="0">
		<tbody>		
			<c:if test="${modelUc.copyProperties!='true'}">
				<c:if test="${modelUc.userReadWriteAccess=='true'}">	
				  <tr onMouseOver="this.bgColor='#99CCFF';" 
						onMouseOut="this.bgColor='#F6F6F6';"
						onClick="JavaScript:editProperties('edit_properties_action_param','${modelUc.ucSeqMst.seqMstId}','${modelUc.seqItemId}','${modelUc.systemId}','${modelUc.requestId}','${modelUc.responseId}','${modelUc.rowNo}','${modelUc.columnNo}', '${modelUc.propertyFor}','${modelUc.requestName}','${modelUc.responseName}','${modelUc.systemName}', '${modelUc.CONTEXT_PATH}/Properties.htm','${modelUc.systemType}','${modelUc.sequenceVersion}','${modelUc.sysSeqId}')">
						<td id="new_propName" class="${modelUc.editclass}" align="left" height="20" width="150" nowrap="nowrap" colspan="2"><b>Edit Information</b></td>
					</tr>
				</c:if>
			</c:if>
			<c:if test="${fn:containsIgnoreCase(modelUc.systemType, 'sys_seq') and modelUc.copyProperties!='true'}">
				<c:if test="${modelUc.userReadAccess=='true'}">	
					<tr onMouseOver="this.bgColor='#99CCFF';" 
						onMouseOut="this.bgColor='#F6F6F6';">
						<td id="new_propName" class="${modelUc.editclass}" align="left" height="20" width="150" nowrap="nowrap" colspan="2"><b><a target="_blank" href="${modelUc.CONTEXT_PATH}/ViewInterface.htm?seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&requestId=${modelUc.requestId}&responseId=${modelUc.responseId}&sequenceVersion=UNKNOWN_${modelUc.sequenceVersion}&systemId=${modelUc.systemId}&propertyFor=${modelUc.propertyFor}">View >>> Interface <<<</a></b></td>
					</tr>
				
				  <tr onMouseOver="this.bgColor='#99CCFF';" 
						onMouseOut="this.bgColor='#F6F6F6';">
						<td id="new_propName" class="${modelUc.editclass}" align="left" height="20" width="150" nowrap="nowrap" colspan="2"><b><a target="_blank" href="${modelUc.CONTEXT_PATH}/SeqDetA.htm?seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&for_request_id=${modelUc.forRequestId}&sequenceVersion=UNKNOWN_${modelUc.sequenceVersion}">View System Sequence</a></b></td>
					</tr>
				</c:if>
			</c:if>	
			<c:if test="${modelUc.rowNo==1 and modelUc.columnNo==1}">
				<tr onMouseOver="this.bgColor='#99CCFF';" 
					onMouseOut="this.bgColor='#F6F6F6';">
					<td id="new_propName" class="${modelUc.editclass}" align="left" height="20" width="150" nowrap="nowrap" colspan="2"><b><a target="_blank" href="${modelUc.CONTEXT_PATH}/ViewInterface.htm?seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&sys_seq_id=${modelUc.ucSeqMst.sysSeqId}&requestId=${modelUc.requestId}&responseId=${modelUc.responseId}&sequenceVersion=UNKNOWN_${modelUc.sequenceVersion}&systemId=${modelUc.systemId}&propertyFor=${modelUc.propertyFor}">View >>> Interface <<<</a></b></td>
				</tr>
			</c:if>				
			<c:if test="${modelUc.imageUrl!=null and modelUc.imageUrl!=''}">
	  	        <tr>
				    <td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">------------------------------------------------- webpage ${modelUc.propertyFor} -------------------------------------------------</td>
			    </tr>	
			    <tr>
					<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2"><a href="${modelUc.imageUrl}" target="_blank"><img src="${modelUc.imageUrl}" alt="Loading Image..." height="200" width="440"></a></td>
				</tr>			
			</c:if>
			<c:if test="${modelUc.failureImageUrl!=null and modelUc.failureImageUrl!=''}">
				<c:if test="${modelUc.propertyFor=='response'}">
				<tr>
				    <td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">--------------------------------------------- webpage failure ${modelUc.propertyFor} --------------------------------------------</td>
			    </tr>	
			    <tr>
					<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2"><a href="${modelUc.failureImageUrl}" target="_blank"><img src="${modelUc.failureImageUrl}" alt="Loading Image..." height="200" width="440"></a></td>
				</tr>			
				</c:if>
			</c:if>
		
			<c:if test="${modelUc.description!=null and modelUc.description!=''}">
		    <tr>
				<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">----------------------------------------------------- description -----------------------------------------------------</td>
			</tr>				
		  <tr>
				<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">
					<textarea maxlength="3900" name="descTA" id="descTA" cols="60" rows="6">${modelUc.description}</textarea></td>
			</tr>			
			</c:if>
			
				<c:if test="${modelUc.sample!=null and modelUc.sample!=''}">
					<tr>
						<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">---------------------------------------------------- sample message ------------------------------------------------</td>
					</tr>
				    <tr>
						<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">
						<textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="60" rows="6">${modelUc.sample}</textarea></td>
					</tr>			
				</c:if>

	            <c:if test="${modelUc.sampleFailure!=null and modelUc.sampleFailure!=''}">
	            	<c:if test="${modelUc.propertyFor=='response'}">
						<tr>
							<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">------------------------------------------------ sample failure message -------------------------------------------</td>
						</tr>
					    <tr>
							<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">
							<textarea maxlength="3900" name="sampleTA" id="sampleFailureTA" cols="60" rows="6">${modelUc.sampleFailure}</textarea></td>
						</tr>
					</c:if>			
				</c:if>
			<c:if test="${modelUc.hostClusterName!=null and modelUc.hostClusterName!=''}">
			    <tr>
					<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">----------------------------------------------------- Host -----------------------------------------------------</td>
				</tr>				
			    <tr>
					<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">
						<textarea maxlength="3900" name="descTA" id="descTA" cols="60" rows="6">${modelUc.hostClusterName}</textarea></td>
				</tr>			
			</c:if>
			<c:if test="${modelUc.ucSeqDiagramPropertyList[0].propertyName!=null}">
			<tr>
				<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">------------------------------------------------------- properties ----------------------------------------------------</td>
			</tr>			
			</c:if>
			<c:set var="x" value="0" />
		    <c:forEach items="${modelUc.ucSeqDiagramPropertyList}" var="prop" >
		    	<c:if test="${prop.propertyName!=null and prop.propertyValue!=null}">
		  			<c:set var="changed" value="false" />
		         	<c:if test="${x=='0' && changed=='false'}">
						<tr  onMouseOver="this.bgColor='#99CCFF';" 
							onMouseOut="this.bgColor='#85E0E0';">
							<td id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</td>
							<c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
								<td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></td>
							</c:if>
							<c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
								<td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></td>
							</c:if>
						</tr>
						<c:set var="changed" value="true" />
						<c:set var="x" value="1" />
					</c:if>
					<c:if test="${x=='1' && changed=='false'}">
						<c:set var="x" value="0" />
						<tr  onMouseOver="this.bgColor='#99CCFF';" 
							onMouseOut="this.bgColor='#F6F6F6';">
							<td id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</td>
							<c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
								<td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></td>
							</c:if>
							<c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
								<td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></td>
							</c:if>							
														
		        		</tr>
		        	</c:if>
		  		</c:if>
		  </c:forEach>
		</tbody>
	</table>
</div>