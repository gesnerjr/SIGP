<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${locale}" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><fmt:message key="titulo" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="Content-Language" content="en-GB" />
    <meta name="author" content="Marco Aurélio Gerosa" />
    <meta name="abstract" content="Software Engineering and Collaborative Systems Research Group" />
    <meta name="description" content="Software Engineering and Collaborative Systems Research Group of
    the Institute of Mathematics and Statistics - University of São Paulo" />
    <meta name="keywords" content="" />
    <meta name="distribution" content="global" />
    <meta name="revisit-after" content="1 days" />  

	<!--imports the main css file-->
	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/css/style.css'></c:url>" />
	<!--imports prettyPhoto css file-->
	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/css/prettyPhoto.css'></c:url>" />
	<!--imports Nivo Slider css file-->
	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/css/nivo-slider.css'></c:url>" />
    <!--imports JCrop css file-->
    <link rel="stylesheet" href="<c:url value='/css/jquery.Jcrop.css'/>" type="text/css" />
    <!--imports jQuery Token Input css file-->    
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/token-input.css'/>" />
    


	<!--imports jQuery-->
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.1.min.js'></c:url>"></script>
	<!--imports jQuery ui -->
    <script type="text/javascript" src="<c:url value='/js/jquery-ui-1.8.16.custom.min.js'/>"></script>
	<!--imports twitter feed plugin-->
	<script type="text/javascript" src="<c:url value='/js/jquery.tweet.js'></c:url>"></script>
	<!--imports easing plugin-->
	<script type="text/javascript" src="<c:url value='/js/easing.js'></c:url>"></script>
	<!--imports prettyPhoto plugin-->
	<script type="text/javascript" src="<c:url value='/js/jquery.prettyPhoto.js'></c:url>"></script>
	<!--imports jQuery Tools plugin-->
	<script type="text/javascript" src="<c:url value='/js/jquery.tools.min.js'></c:url>"></script>
	<!--imports jQuery Nivo Slider plugin-->
	<script type="text/javascript" src="<c:url value='/js/jquery.nivo.slider.js'></c:url>"></script>
	<!--imports jQuery superfish plugin-->
	<script type="text/javascript" src="<c:url value='/js/superfish.js'></c:url>"></script>
	<!--imports jQuery jflickrfeed plugin-->
	<script type="text/javascript" src="<c:url value='/js/jflickrfeed.min.js'></c:url>"></script>
	<!--imports jQuery form -->
    <script type="text/javascript" src="<c:url value='/js/jquery.form.js'/>"></script>
    <!--imports JQuery JCrop -->
    <script type="text/javascript" src="<c:url value='/js/jquery.Jcrop.min.js'/>"></script>
    <!--imports jQuery Token Input-->
    <script type="text/javascript" src="<c:url value='/js/jquery.tokeninput.js'/>"></script>
	
	<!--imports custom javascript code-->
	<script type="text/javascript" src="<c:url value='/js/custom.js'></c:url>"></script>
    <script type="text/javascript" src="<c:url value='/js/utils.js'/>"></script>
    
    <!-- icons -->
    <link rel="shortcut icon" href="<c:url value='/images/favicon.png'></c:url>"  />
    <link rel="icon" href="<c:url value='/images/favicon.png'></c:url>" />
	
	<!--[if IE 7]><link href="<c:url value='/css/ie7.css'></c:url>" rel="stylesheet" type="text/css" media="screen" /><![endif]-->
	<!--[if IE 8]><link href="<c:url value='/css/ie8.css'></c:url>" rel="stylesheet" type="text/css" media="screen" /><![endif]-->
</head>

<body>
<!----------- HEADER ---------->
    <div id="header" class="pattern-1">
        <div id="header-inner">
            <div id="logo">
                <img src="<c:url value='/images/lapessc_small.gif'></c:url>" alt="LAPPESC" /><br />
                <div id="title">
                    <h1><nobr>Software Engineering &</nobr> <nobr>Collaborative Systems</nobr> <nobr>Research Lab</nobr></h1>
                </div><!-- end title -->
            </div><!-- end logo -->

            <ul id="navigation">
                <li>
                    <a href="<c:url value='/'></c:url>" <c:if test="${headername == 'index' or empty headername}">class="active-nav"</c:if>>
                    Home
                    </a>
                </li>

                <li>
                    <a href="<c:url value='/linhadepesquisa/'></c:url>" <c:if test="${headername == 'linha'}">class="active-nav"</c:if>>
                    <fmt:message key="header.linhaspesquisa" />
                    </a><br /><br />
                    <ul>
                        <li><a href="research_lines.html">
                            Current
                            </a>
                        </li>
                        <li><a href="previous_research_lines.html">
                            Previous
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="<c:url value='/projeto/'></c:url>" <c:if test="${headername == 'projeto'}">class="active-nav"</c:if>>
                    <fmt:message key="header.projetos" />
                    </a>
                </li>

                <li>
                    <a href="<c:url value='/publicacao/'></c:url>" <c:if test="${headername == 'publicacao'}">class="active-nav"</c:if>>
                    <fmt:message key="header.publicacoes" />
                    </a>
                </li>

                <li>
                    <a href="<c:url value='/software/'></c:url>" <c:if test="${headername == 'software'}">class="active-nav"</c:if>>
                    <fmt:message key="header.software" />
                    </a>
                </li>

                <li>
                    <a href="<c:url value='/contribuinte/'></c:url>" <c:if test="${headername == 'membro'}">class="active-nav"</c:if>>
                    <fmt:message key="header.contribuintes" />
                    </a>
                </li>

                <li>
                    <a href="<c:url value='/contact/'></c:url>">
                    Contact
                    </a>
                </li>
            </ul><!-- end navigation -->

            <div class="clear"></div><!-- end clearfix -->
        </div><!-- end header-inner -->
    </div><!-- end header -->
    

<%-- 
<ul>
	<li><span class="i18n-link">
		<a href="<c:url value="/lang/mudarLingua?lingua=en"></c:url>">
		  <img src="<c:url value='/images/flags/en.png'/>" class="i18n-icon" width="16" height="12" alt="English"/>
		</a>&nbsp;
		<a href="<c:url value="/lang/mudarLingua?lingua=en"></c:url>">English</a>
		</span>
	</li>
	<li><span class="i18n-link">
		<a href="<c:url value="/lang/mudarLingua?lingua=pt"></c:url>" class="active">
		  <img src="<c:url value='/images/flags/pt-br.png'/>" class="i18n-icon" width="16" height="12" alt="Portuguese, Brazil"/>
	    </a>&nbsp;
	    <a href="<c:url value="/lang/mudarLingua?lingua=pt"></c:url>" class="active">Português, Brasil</a></span>
	</li>
</ul>
						
<span id="logged">
	<a href="<c:url value="/login/"></c:url>" id="login_buttom"><fmt:message key="header.login" /></a>
</span>
--%>