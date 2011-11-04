<cfcomponent extends="Controller">

  <cffunction name="init">
    <cfset filters(through="loginRequired")>
    <cfset usesLayout(template="/cmslayout")>
  </cffunction>

  <cffunction name="index">
      <cfset snippetsAndCategories = model('CMSSnippet').findAll(order="categoryid,name", include="category", groupby="categoryid")>
    <!--- <cfset categories = model('CMSCategory').findAll(order="name")> --->
  </cffunction>

  <cffunction name="new">
    <cfset snippet = model('CMSSnippet').new()>
    <cfset category = model('CMSCategory').new()>
    <cfset categories = model('CMSCategory').findAll()>
  </cffunction>

  <cffunction name="edit">
  	<cfset snippet = model('CMSSnippet').findByKey(params.key)>
	<cfset category = model('CMSCategory').new()>
    <cfset categories = model('CMSCategory').findAll()>

    <cfif NOT IsObject(snippet)>
      <cfset flashInsert(info="No snippet exists for ID #params.key#")>

     	<cftry>
      	<cfset redirectTo(back=true)>

      	<cfcatch type="Wheels.RedirectBackError">
      		<cfset redirectTo(route="snippets_path")>
      	</cfcatch>
      </cftry>
    </cfif>
  </cffunction>

  <cffunction name="create">
    <cfset snippet = model('CMSSnippet').new(params.snippet)>

    <!--- create our snippets filename --->
    <cfset snippet.fileName = createUUID() & ".cfm">

    <cfif snippet.save()>
        <cfset flashInsert(success="The snippet was created successfully")>
        <cfset redirectTo(route="edit_snippet_path", key=snippet.id)>
        <!--- <cfset redirectTo(route="snippets_path")> --->
    <cfelse>
        <cfset category = model('CMSCategory').new()>
    <cfset categories = model('CMSCategory').findAll()>
        <cfset flashInsert(error="There was an error creating the snippet.")>
  		<cfset renderPage(action="new")>
    </cfif>
  </cffunction>

  <cffunction name="update">
  	<cfset snippet = model('CMSSnippet').findByKey(params.key)>

    <!--- delete our old file --->
    <cfif fileExists("#application.defaults.snippetsPath#/#snippet.fileName#")>
  	    <cffile action="delete" file="#application.defaults.snippetsPath#/#snippet.fileName#">
  	</cfif>
    <!--- change our filename to the new file --->
	<cfset snippet.fileName = createUUID() & ".cfm">

  	<cfif snippet.update(params.snippet)>
  	    <!--- write the file to disk --->
		<cffile action="write" file="#application.defaults.snippetsPath#/#snippet.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='s' />#snippet.content#" addnewline="no" fixnewline="yes" />

  		<cfset flashInsert(success="The snippet was updated successfully.")>
      <cfset redirectTo(route="edit_snippet_path", key=snippet.id)>
      <!--- <cfset redirectTo(route="snippets_path")> --->
  	<cfelse>
  		<cfset flashInsert(error="There was an error updating the snippet.")>
  		<cfset category = model('CMSCategory').new()>
      <cfset categories = model('CMSCategory').findAll()>
  		<cfset renderPage(action="edit")>
  	</cfif>
  </cffunction>

  <cffunction name="delete">
  	<cfset snippet = model('CMSSnippet').findByKey(params.key)>

  	<cfif snippet.delete()>
  		<cfset flashInsert(success="The snippet was deleted successfully. Make sure that none of your pages or layouts are using it.")>
      <cfset redirectTo(route="snippets_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error deleting the snippet.")>
  		<cfset redirectTo(route="snippets_path")>
  	</cfif>
  </cffunction>

</cfcomponent>