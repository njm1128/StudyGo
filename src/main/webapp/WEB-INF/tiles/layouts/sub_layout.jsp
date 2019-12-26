<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertAttribute name="html_header" />	
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="sub_banner" />
<tiles:insertAttribute name="download" />
<tiles:insertAttribute name="submenu" />
<div class="content">
	<tiles:insertAttribute name="left_side" />
	<tiles:insertAttribute name="content" />
	<tiles:insertAttribute name="right_side" />
</div>
<tiles:insertAttribute name="footer" />
<tiles:insertAttribute name="html_footer" />