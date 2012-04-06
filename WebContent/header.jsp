<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${locale}" scope="session"/>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-GB">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="en-GB" />
    <meta name="author" content="Guilherme M. Nogueira" />
    <meta name="abstract" content="Artigos do grupo de trabalho do professor Marco Aurélio Gerosa" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="distribution" content="global" />
    <meta name="revisit-after" content="1 days" />	
    <meta name="copyright" content="All content (c)" />

   	<title><fmt:message key="titulo" /></title>

<%-- 
    <style type="text/css" title="The shiny, Web 2.0 version of 'Simplicity,' a pseudo-professional style-sheet." media="all">
      @import "/SIGP/styles/simplicity-two-oh-three.css";
    </style>
--%>    
    <style type="text/css" title="The shiny, Web 2.0 version of 'Simplicity,' a pseudo-professional style-sheet." media="all">
      @import "/SIGP/styles/ccsl.css";
    </style>
    <!--[if IE]>
    <style type="text/css" media="all">
      @import "/SIGP/styles/ie-diff.css";
    </style> 
    <![endif]-->
    
   	<link type="text/css" href="/SIGP/styles/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
  	<link rel="stylesheet" href="/SIGP/styles/jquery.Jcrop.css" type="text/css" />
	<script type="text/javascript" src="/SIGP/js/jquery-1.6.2.min.js"></script>
	<script type="text/javascript" src="/SIGP/js/jquery-ui-1.8.16.custom.min.js"></script>
	<script type="text/javascript" src="/SIGP/js/utils.js"></script>
	<script type="text/javascript" src="/SIGP/js/jquery.form.js"></script>
	<script type="text/javascript" src="/SIGP/js/jquery.min.js"></script>
	<script type="text/javascript" src="/SIGP/js/jquery.Jcrop.min.js"></script>
	

    <%-- <link rel="stylesheet" type="text/css" href="/SIGP/styles/print.css" media="print" /> --%>
    <link rel="shortcut icon" href="/favicon.png"  />
    <link rel="icon" href="/favicon.png" />
  </head>

  <body>
    
      <div id="container">
        <div id="barra">
      		<div class="clear-block block block-translation">
				<div class="content">
					<div class="item-list">
						<ul>
							<li><span class="i18n-link">
								<a href="<c:url value="/lang/mudarLingua?lingua=en"></c:url>"><img src="/SIGP/images/flags/en.png" class="i18n-icon" width="16" height="12" alt="English"/></a>&nbsp;<a href="<c:url value="/lang/mudarLingua?lingua=en"></c:url>">English</a></span>
							</li>
							<li><span class="i18n-link">
								<a href="<c:url value="/lang/mudarLingua?lingua=pt-br"></c:url>" class="active"><img src="/SIGP/images/flags/pt-br.png" class="i18n-icon" width="16" height="12" alt="Portuguese, Brazil"/></a>&nbsp;<a href="<c:url value="/lang/mudarLingua?lingua=pt-br"></c:url>" class="active">Português, Brasil</a></span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<span id="logged">
				<a href="<c:url value="/login/"></c:url>" id="login_buttom"><fmt:message key="header.login" /></a>
			</span>
        </div>
        
        <div id="header"><br /><h1><fmt:message key="titulo" /></h1></div>

    	<div id="menu">
			<ul>
				<!--[if IE 6]><li></li><![endif]-->
				<li <c:if test="${headername == 'index' or empty headername}">class="active"</c:if>>
					<a href="/SIGP/" >Inicio</a>
				</li>
				
				<li <c:if test="${headername == 'linha'}">class="active"</c:if>>
					<a href="/SIGP/linhadepesquisa/" ><fmt:message key="header.linhaspesquisa" /></a>
				</li>
				<%--
				<li <c:if test="${headername == 'grupo'}">class="active"</c:if>>
					<a href="/SIGP/grupo/"><fmt:message key="header.grupos" /></a>
				</li>
				--%>
				<li <c:if test="${headername == 'projeto'}">class="active"</c:if>>
					<a href="/SIGP/projeto/"><fmt:message key="header.projetos" /></a>
				</li>
				<%-- <li><a href="/SIGP/disciplina/"><fmt:message key="header.disciplinas" /></a></li> --%>
				<li <c:if test="${headername == 'membro'}">class="active"</c:if>>
					<a href="/SIGP/contribuinte/"><fmt:message key="header.contribuintes" /></a>
				</li>
				<li <c:if test="${headername == 'publicacao'}">class="active"</c:if>>
					<a href="/SIGP/publicacao/"><fmt:message key="header.publicacoes" /></a>
				</li>
			</ul>
		</div>

        <div id="body">

            <div id="monocontent">
            
