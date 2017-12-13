# How To Apply the Styling


## The Navbar:

Copy the following Code:

```aspx
<% if(Session["Username"] != null){ 
Response.WriteFile("Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("Pages/unsigned-menu.inc");
}
%>

```

in the aspx file (exammple Default.aspx) directly after the beginning of the body tag

```html
<body>
```

for example:

```aspx
<body>
<% if(Session["Username"] != null){ 
Response.WriteFile("Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("Pages/unsigned-menu.inc");
}
%>
...The rest of your code
```

## The Footer:
Copy the following Code:

```html
<!--#include file="Pages/footer.inc"-->
```

in the aspx file (exammple Default.aspx) directly before the end of the body tag

```html
</body>
```

for example:

```html
<!--#include file="Pages/footer.inc"-->
</body>
```

## Extra Styling

### Panel

Adding a surrounding box around your content like in Profile.aspx

Add the following div tag before your content and close it after 

```html
<div class="panel panel-default"> 
<div class="panel-body"> 

Content here

</div>
</div>
```

### Columns

To divide your content into columns like in Profile

- Create a row
- Create column 1 with width from 1-12 (12 means full width)
- Create column 2 with width from 1-12 (12 means full width)

The summation of your columns width should be 12

```html
<div class="row">
<div class="col-sm-8">
Column 1 here and it is taking 2/3 of the page width
</div>
<div class="col-sm-4">
Column 2 here and is taking 1/3 of the page width
</div>
</div>
```

### Buttons
- Set the CSS Class to btn btn-default

```aspx
<asp:Button id="btn_update" runat="server" Text="Update Info" OnClick="updateInfo" CssClass="btn btn-default"></asp:Button><br />
```

### Input Forms

- Create a div before your group of inputs (inside the aspx form)
- Set the class of your input textboxes to "form-control"
- Close the tag

```aspx
<div class="form-group">
<b><asp:Label id="lbl_username" runat="server" Text="Username:"></asp:Label><br />
<asp:TextBox id="txt_username" runat="server" CssClass="form-control"></asp:TextBox><br/>
<asp:Label id="lbl_personal_email" runat="server" Text="Personal Email:"></asp:Label><br />
<asp:TextBox id="txt_personal_email" runat="server" CssClass="form-control"></asp:TextBox><br/>

<asp:Button id="btn_update" runat="server" Text="Update Info" OnClick="updateInfo" CssClass="btn btn-default"></asp:Button><br />
```


### Table formatting

- Set the table css class to "table table-striped"

```aspx
Table jobs_table = new Table();
jobs_table.CssClass = "table table-striped";
```

## General Styling guidelines

- For subheadings (Example Personal information in Profile.aspx or Quick Actions), *** use <h3> tag ***

## Setting CSS CLass in ASPX

```aspx
Table jobs_table = new Table();
jobs_table.CssClass = "table table-striped";
```

Same with anything else

# Important:
- If you have any questions ask me
- If something doesn't look right and you will need to edit the css file make sure to contact me first so that we don't make a conflict and screw how everything looks


*** Thanks peeps,
KG
***
