<%@ Page Language="C#" Inherits="iWork.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Default</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
        Response.WriteFile("Pages/menu.inc");
    } else if(Session["Username"] == null){
        Response.WriteFile("Pages/unsigned-menu.inc");
    }
    %>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="images/MainBanner.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="images/BusinessBanner.jpg" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="images/JobSeekerBanner.jpg" alt="New york" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
<br />
<blockquote>
    <p>For the past 10 years we have been looking for something like this! We have been struggling here at facebook and such an idea with such a design is nothing that any of us could have ever done</p>
    <footer>Mark Zuckerburg, Founder and CEO, Facebook</footer>
  </blockquote>
  <br />
  <blockquote>
    <p>Knowing that a website like iWork exists makes me optimistic about the future and makes me able to focus more on creating electric cars and getting people to Mars. Thank you iWork.</p>
    <footer style="text-align: right;">Elon Musk, Founder and CEO, SpaceX and Tesla</footer>
  </blockquote>
  <br />
    <!--#include file="Pages/footer.inc"-->
</body>
</html>
