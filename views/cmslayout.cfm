<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><cfoutput>#application.admin.title#</cfoutput></title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js" type="text/javascript"></script>

	<cfoutput>
	 #stylesheetLinkTag("cms/base, cms/jquery.treeTable, cms/themes/blue/style, cms/splash/jquery-ui-1.7.2.custom")#
     #javascriptIncludeTag("cms/jquery.treeTable.min,cms/application")#
	</cfoutput>

  <cfif params.controller is "CMSPages" and (params.action is "new" or params.action is "edit")>
    <cfoutput>#javascriptIncludeTag("cms/pages")#</cfoutput>
  </cfif>

  <cfif params.controller is "CMSSnippets" and (params.action is "new" or params.action is "edit")>
    <cfoutput>#javascriptIncludeTag("cms/snippets")#</cfoutput>
  </cfif>

</head>
<body>
  <div id="container">
    <div id="header">
        <cfoutput>
            <h1>#linkTo(text="#application.admin.title#", route="admin_path")#</h1>

            #includePartial('/shared/cms/user_navigation')#
            #includePartial('/shared/cms/main_navigation')#
        </cfoutput>

    </div>
    <div id="wrapper">
      <div id="main">

        <div class="block">
          <cfoutput>
            <!--- secondary navigation will go here if we ever need it --->
            #includePartial("/shared/cms/render_flash")#
          </cfoutput>
          <div class="content">
            <div class="inner">
              <cfoutput>#contentForLayout()#</cfoutput>
            </div>
          </div>
        </div>

        <cfoutput>#includePartial('/shared/cms/footer')#</cfoutput>
      </div>
    </div>
  </div>
</body>
</html>