# How To Apply the Styling


### The Navbar:

Copy the following Code:

```
<% if(Session["Username"] != null){ 
Response.WriteFile("Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("Pages/unsigned-menu.inc");
}
%>

```

in the aspx file (exammple Default.aspx) directly after the beginning of the body tag

```
<body>
```

for example:

```
<body>
<% if(Session["Username"] != null){ 
Response.WriteFile("Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("Pages/unsigned-menu.inc");
}
%>
...The rest of your code
```

### The Footer:
Copy the following Code:

```
<!--#include file="Pages/footer.inc"-->
```

in the aspx file (exammple Default.aspx) directly before the end of the body tag

```
</body>
```

for example:

```
<!--#include file="Pages/footer.inc"-->
</body>
```