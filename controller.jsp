<%@page import="com.baidu.ueditor.ConfigManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.baidu.ueditor.ActionEnter"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%!
ConfigManager getConfigManager(HttpServletRequest request){
	ServletContext application = request.getSession().getServletContext();
	Object object = application.getAttribute("UEDITOR_configManager");
	if(object != null){
		return (ConfigManager)object;
	}else{
		String rootPath = application.getRealPath( "/" );
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		ConfigManager configManager = ConfigManager.getInstance(rootPath, contextPath, uri);
		request.getSession().getServletContext().setAttribute("UEDITOR_configManager",configManager);
		return configManager;
	}
}
%>

<%

    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	
	//String rootPath = application.getRealPath( "/" );
	//out.write( new ActionEnter( request, rootPath ).exec() );
	
	out.write( new ActionEnter( request, getConfigManager(request) ).exec() );
	
%>

