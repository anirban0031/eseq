<%@ include file="include.jsp"%>
<div id="${modelUc.seqdetDiv}">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">


			<c:forEach items="${modelUc.ucDisplayDataRowList}" var="row" >
				<tr>
			<c:forEach items="${row}" var="col" >

							
													
							<c:if test="${col.ucObjectEnum=='customer'  or col.ucObjectEnum=='system' or col.ucObjectEnum=='system11' or col.ucObjectEnum=='system13' or col.ucObjectEnum=='asynchSource' or col.ucObjectEnum=='asynchDestination' or col.ucObjectEnum=='ifCondition' or col.ucObjectEnum=='sequenceSection'}">						
							<td id="td_SYSTEM${col.ucSeqDiagram.rowNo}" align=center valign="top"  height="100" width="150" ${col.htmlStr} >
								<table id="table_SYSTEM${col.ucSeqDiagram.rowNo}" align="center" height="100%" width="100%" cellpadding="0" cellspacing="0">
									<tr>
									<c:if test="${col.ucSeqDiagram.expanded!=null}">
									
<!-- TR 1-->									
	<!-- TD 1-->
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
									  <td height="15%" width="15%" style="vertical-align: top;text-align: left;border-top: 4px dashed gray;border-left: 4px dashed gray;">
									  </c:if>
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
									  <td height="15%" width="15%" style="vertical-align: top;text-align: left;border-left: 4px dashed gray;">
									  </c:if>
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination==null}">
									  <td height="15%" width="15%" style="vertical-align: top;text-align: left;">
									  </c:if>
									
												<c:if test="${col.ucSeqDiagram.expanded=='true'}">
													<img class="mousetoHand" src="images/nav/minus.png" alt="close" onclick="seqUpdateOpenClose( 'close_tree_node', '${modelUc.sequenceVersion}','${col.ucSeqDiagram.seqMstId}', ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '<c:url value="/GlobalGetSeqUpdate.htm" />', '${col.ucSeqDiagram.sysSeqId}');"/>
												</c:if>
												<c:if test="${col.ucSeqDiagram.expanded!='true'}">
													<img  class="mousetoHand"  src="images/nav/plus.png" alt="open" onclick="seqUpdateOpenClose( 'expand_tree_node', '${modelUc.sequenceVersion}','${col.ucSeqDiagram.seqMstId}', ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '<c:url value="/GlobalGetSeqUpdate.htm" />', '${col.ucSeqDiagram.sysSeqId}');"/>
													
												</c:if>
										</td>
	<!-- TD 2-->									
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
										<td style="vertical-align: top;text-align: right;border-right: 4px dashed gray;border-top: 4px dashed gray;">
									  </c:if>
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
									  <td style="vertical-align: top;text-align: right;border-right: 4px dashed gray;">
									  </c:if>
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination==null}">
									  <td style="vertical-align: top;text-align: right;">
									  </c:if>
												

												<c:if test="${col.ucSeqDiagram.seqItemId!=null   and col.ucSeqDiagram.asynchSourceDestination !=null}">
												   
												   <c:if test="${fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
													<img title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />">
												   </c:if>
												   <c:if test="${not fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
													<img class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />" 
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}');">
													
												   </c:if>
												</c:if>
												<c:if test="${col.ucSeqDiagram.seqItemId!=null   and col.ucSeqDiagram.asynchSourceDestination ==null}">
													<c:if test="${fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />">
												   </c:if>
												   <c:if test="${not fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
												   
														<img class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />" 
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '');">
													
												   </c:if>
													
												</c:if>
												<c:if test="${col.ucSeqDiagram.seqItemId==null and col.ucSeqDiagram.asynchSourceDestination !=null}">
													<c:if test="${fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />">
												   </c:if>
												   <c:if test="${not fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
												   
														<img class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />" 
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}');">
													
												   </c:if>
												</c:if>
												<c:if test="${col.ucSeqDiagram.seqItemId==null and col.ucSeqDiagram.asynchSourceDestination ==null}">
													<c:if test="${fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />">
												   </c:if>
												   <c:if test="${not fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">

														<img class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />" 
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '');">

												   </c:if>												
														
												</c:if>		
											
										</td>
									</c:if>	
									<c:if test="${col.ucSeqDiagram.expanded==null}">								
									<c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
										<td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-left: 4px dashed gray;border-right: 4px dashed gray;border-top: 4px dashed gray;">
									  </c:if>
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
										<td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-left: 4px dashed gray;border-right: 4px dashed gray;">
									  
									  </c:if>
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination==null}">
										<td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;">
									  </c:if>									
										
								
												<c:if test="${col.ucSeqDiagram.seqItemId!=null and col.ucSeqDiagram.asynchSourceDestination !=null}">
													<c:if test="${fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />">
												   </c:if>
												   <c:if test="${not fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />" 
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}');">
												   </c:if>																								
												
													
												</c:if>
												<c:if test="${col.ucSeqDiagram.seqItemId!=null and col.ucSeqDiagram.asynchSourceDestination ==null}">
													<c:if test="${fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />">
												   </c:if>
												   <c:if test="${not fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
													<img class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />" 
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '');">

												   </c:if>																																				
												</c:if>

												<c:if test="${col.ucSeqDiagram.seqItemId==null  and col.ucSeqDiagram.asynchSourceDestination !=null}">
													<c:if test="${fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />">
												   </c:if>
												   <c:if test="${not fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />" 
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}');">
												   </c:if>	
														
												</c:if>
												<c:if test="${col.ucSeqDiagram.seqItemId==null  and col.ucSeqDiagram.asynchSourceDestination ==null}">
													<c:if test="${fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />">
												   </c:if>
												   <c:if test="${not fn:containsIgnoreCase(col.ucSeqDiagram.systemPropertiesFound, 'gray')}">
														<img class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${col.ucSeqDiagram.systemPropertiesFound}.png" />" 
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '');">
												   </c:if>												
														
												</c:if>
											
										</td>
										</c:if>
										</tr>
<!-- TR 2-->
	<!-- TD 1-->									
									<tr>
									<c:if test="${ col.ucObjectEnum=='ifCondition' or col.ucObjectEnum=='sequenceSection'}">
										<td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-bottom: 1px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}">
										
									</c:if>	
									<c:if test="${ col.ucObjectEnum!='ifCondition' and col.ucObjectEnum!='sequenceSection'}">
									<!-- HAVE_A_LOOK -->
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
  									    <td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}">
									  </c:if>
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
										<td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;border-bottom: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}">
									  </c:if>
									  <c:if test="${col.ucSeqDiagram.asynchSourceDestination==null}">
										<td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}">
									  </c:if>
									</c:if>										
											<div class="tooltip">${col.displayName} &nbsp;<!-- <span>TEST</span> --></div>
											<c:if test="${col.ucSeqDiagram.selected=='true'}"><A NAME="selectedSeqItem"></A></c:if> 
										</td>
									</tr>
									
								</table>
							</td>							
							</c:if>

							<c:if test="${col.ucObjectEnum!='customer' and col.ucObjectEnum!='ifCondition' and col.ucObjectEnum!='system11' and col.ucObjectEnum!='system13' and col.ucObjectEnum!='sequenceSection' and col.ucObjectEnum!='system' and col.ucObjectEnum!='asynchSource' and col.ucObjectEnum!='asynchDestination'}">
									${col.htmlStr}									
							</c:if>
							
				
					</c:forEach>
				</tr>			
		</c:forEach>
	</table>
</div>
