<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.baidu.ueditor.ConfigManager"%>
<%@ page import="com.baidu.ueditor.ActionEnter"%>

<%!
/**
 *获取ueditor 配置管理
 *@param request
 *@param fileStorePath 文件存放根路径,为空时为项目根路径
 *@return ConfigManager
 */
ConfigManager getConfigManager(HttpServletRequest request,String fileStorePath){
	ServletContext application = request.getSession().getServletContext();
	Object object = application.getAttribute("UEDITOR_configManager");
	if(object != null){
		return (ConfigManager)object;
	}else{
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		String rootPath = application.getRealPath("/");
		ConfigManager configManager = ConfigManager.getInstance(fileStorePath,rootPath, contextPath, uri);
		request.getSession().getServletContext().setAttribute("UEDITOR_configManager",configManager);
		return configManager;
	}
}
%>

<%
    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	out.write( new ActionEnter( request, getConfigManager(request,"E://temp")).exec() );
%>
