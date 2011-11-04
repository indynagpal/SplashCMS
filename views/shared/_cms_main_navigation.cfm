<cfoutput>
    <div id="main-navigation">
        <ul>
            <li <cfif params.controller is 'pages'>class="active"</cfif>>
                #linkTo(text="Pages", route="pages_path")#
            </li>
            <li <cfif params.controller is 'snippets'>class="active"</cfif>>
                #linkTo(text="Snippets", route="snippets_path")#
            </li>
            <li <cfif params.controller is 'layouts'>class="active"</cfif>>
                #linkTo(text="Layouts", route="layouts_path")#
            </li>
            <li <cfif params.controller is 'users'>class="active"</cfif>>
                #linkTo(text="Users", route="users_path")#
            </li>
            <!--- this section will output the custom tabs you add to the admin --->
            <cfif structKeyExists(application.admin, "tabs")>
                <cfloop from="1" to="#arrayLen(application.admin.tabs.titles)#" index="i">
                <li <cfif params.controller is application.admin.tabs.titles[i]>class="active"</cfif>>
                    #linkTo(text=titleize(application.admin.tabs.titles[i]), route=application.admin.tabs.routes[i])#
                </li>
                </cfloop>
            </cfif>
        </ul>
        <div class="clear"></div>
    </div>
</cfoutput>