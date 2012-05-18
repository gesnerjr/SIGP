
<!----------- SIDEBAR ---------->
        <!-- Sidebar Content -->    
        <div id="sidebar" class="sb-right">

            <c:if test="${userIsLogged}">        
            <%@ include file="/admin-box.jsp" %>
            </c:if>            
        
            <div class="sidebar-box">
                <h3>Search</h3>
                <div id="search-form">
                    <form method="post" action="">
                        <input type="text" id="search-box" onfocus="if(this.value=='Enter keywords...')this.value='';" onblur="if(this.value=='')this.value='Enter keywords...';" value="Enter keywords..." />
                        <input type="submit" value="Go !" id="search-button"></input>
                    </form>
                </div>      
            </div><!-- end sidebar-box -->
            
            <div class="sidebar-box">
                <h3>Lastest News</h3>
                <ul class="sidebar-menu arrows">
                    <li><a href="http://www.microsoftinsidersbrasil.com.br/PageNoticia.aspx?cod=439" target=_blank>Smart Audio City Guide won the 3rd place on Imagine Cup Brazil</a></li>
                    <li><a href="http://www.springerlink.com/content/0925-9724/" target=_blank>Paper accepted at JCSCW (comming soon)</a></li>
                    <li><a href="http://www.inovacao.usp.br/olimpiada2011/" target=_blank>Arquigrafia Brazil won the first plance on the USP Innovation Contest</a></li>
                </ul>
            </div><!-- end sidebar-box -->  
            
            <div class="sidebar-box">               
                <h3>Highlights</h3>
                <ul class="latest-blog-posts">
                    <li>
                        <img src="images/sbsc.jpg" alt="Brazilian Symposium on Collaborative Systems"/>
                        <div class="post-details">
                            <h5><a href="http://sws2012.ime.usp.br/sbsc/index.php" target=_blank>SBSC 2012</a></h5>
                            <p>This year, we are organizing in S&atilde;o Paulo the IX Brazilian Symposium on Collaborative Systems. It will occur from October, 15th to 18th. More details about the event in its <a href=""http://sws2012.ime.usp.br/sbsc/index.php" target=_blank>website</a>. </p>
                        </div>
                    </li>
                </ul>
            </div><!-- end sidebar-box -->
        
            
            <div class="sidebar-box">               
                <h3>Related Groups</h3>
                        <a href="http://groupware.les.inf.puc-rio.br" target="_blank"><img src="<c:url value='/images/groupwareLES.jpg'></c:url>" alt="Groupware@LES"/></a>
                        <a href="http://www.lprm.inf.ufes.br/" target="_blank"><img src="<c:url value='/images/lprm.jpg'></c:url>" alt="LPRM - UFES"/></a>
                        <a href="#"><img src="<c:url value='/images/naweb.jpg'></c:url>" alt="NAWEB"/></a>
            </div><!-- end sidebar-box -->



            
        </div><!-- end sidebar -->
        
        <div class="clear"></div>
        
    </div><!-- end wrapper -->


<!----------- FOOTER ---------->
    <div id="footer" class="pattern-1">
        <div id="footer-content">           
        
            <div class="three-fourth" style="height: 80px">         
                <h4>Support and funding</h4>
                    <a href="http://www.usp.br/" target="_blank"><img src="<c:url value='/images/usp.gif'></c:url>" alt="University of São Paulo" style="height: 45px" /></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="http://www.ime.usp.br" target="_blank"><img src="<c:url value='/images/ime.gif'></c:url>" alt="Math and Statistics Institute"  style="height: 45px"/></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="http://www.fapesp.br/" target="_blank"><img src="<c:url value='/images/fapesp.gif'></c:url>" alt="FAPESP"  style="height: 45px" /></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="http://www.cnpq.br/" target="_blank"><img src="<c:url value='/images/cnpq.gif'></c:url>" alt="CNPq"  style="height: 45px" /></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="http://ccsl.ime.usp.br/" target="_blank"><img src="<c:url value='/images/ccsl.gif'></c:url>" alt="FLOSS Competency Center" style="height: 45px" /></a>
            </div>
            
            
                        
            
            <div class="one-forth last">                
                <h4>Contact Us</h4>             
                <p>
                    Prof. Marco Aur&eacute;lio Gerosa<br />
                    E-mail: gerosa@ime.usp.br<br />
                    R. do Mat&atilde;o, 1010, office 209 - S&atilde;o Paulo - SP - Brasil - ZIP 05508-090
                </p>
            </div><!-- end one-fourth -->           
        
            <div class="clear"></div>
            
        </div><!-- end footer-content -->
        
        <div class="clear"></div>
        
        <div id="footer-bottom-content">
        
            <div id="footer-logo">
                <h3><a href="#">LAPESSC</a></h3>
                <p>Research on <span>Software Engineering</span> and<br /> <span>Collaborative Systems</span></p>
            </div><!-- end footer-logo -->
        
            <div id="copyright">                
            License:<br />
            <a href="http://creativecommons.org/licenses/by/3.0/deed.pt_BR" target=_blank><img src="images/creativecommons_by.png" alt="Creative Commons License"></a>
            </div><!-- end copyright -->                    
            
            <a href="#" class="scroll-top">Top</a>
        </div><!-- end footer-bottom-content -->
        
    </div><!-- end footer -->
    
<%@ include file="/ajax-selects.jsp" %> 
</body>
</html>