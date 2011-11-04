<cfscript>
	//  LOGIN ROUTES
	addRoute(name="login", pattern="/admin/login", controller="CMSSessions", action="new");
	addRoute(name="login_path", pattern="/admin/doLogin", controller="CMSSessions", action="create");
	addRoute(name="logout", pattern="/admin/logout", controller="CMSSessions", action="destroy");

	//  PAGE ROUTES
	addRoute(name="edit_home_page_path", pattern="/admin/pages/home/edit/[key]", controller="CMSPages", action="edit");
	addRoute(name="edit_page_path", pattern="/admin/pages/[parentID]/child/edit/[key]", controller="CMSPages", action="edit");
	addRoute(name="new_page_path", pattern="/admin/pages/[parentID]/child/new", controller="CMSPages", action="new");
	addRoute(name="delete_page_path", pattern="/admin/pages/delete/[key]", controller="CMSPages", action="delete");
	addRoute(name="create_page_path", pattern="/admin/pages/[parentID]/create", controller="CMSPages", action="create");
	addRoute(name="update_page_path", pattern="/admin/pages/update/[key]", controller="CMSPages", action="update");
	addRoute(name="pages_path", pattern="/admin/pages", controller="CMSPages", action="index");

	//  SNIPPET ROUTES

	addRoute(name="new_snippet_path", pattern="/admin/snippets/new", controller="CMSSnippets", action="new");
	addRoute(name="edit_snippet_path", pattern="/admin/snippets/edit/[key]", controller="CMSSnippets", action="edit");
	addRoute(name="delete_snippet_path", pattern="/admin/snippets/delete/[key]", controller="CMSSnippets", action="delete");
	addRoute(name="create_snippet_path", pattern="/admin/snippets/create", controller="CMSSnippets", action="create");
	addRoute(name="update_snippet_path", pattern="/admin/snippets/update/[key]", controller="CMSSnippets", action="update");
	addRoute(name="snippets_path", pattern="/admin/snippets", controller="CMSSnippets", action="index");

	//  CATEGORY ROUTES
	addRoute(name="delete_category_path", pattern="/admin/categories/delete/[key]", controller="CMSCategories", action="delete");
	addRoute(name="create_category_path", pattern="/admin/categories/create", controller="CMSCategories", action="create");
	addRoute(name="update_category_path", pattern="/admin/categories/update/[key]", controller="CMSCategories", action="update");


	//  LAYOUT ROUTES
	addRoute(name="new_layout_path", pattern="/admin/layouts/new", controller="CMSLayouts", action="new");
	addRoute(name="delete_layout_path", pattern="/admin/layouts/delete/[key]", controller="CMSLayouts", action="delete");
	addRoute(name="create_layout_path", pattern="/admin/layouts/create", controller="CMSLayouts", action="create");
	addRoute(name="update_layout_path", pattern="/admin/layouts/update/[key]", controller="CMSLayouts", action="update");
	addRoute(name="edit_layout_path", pattern="/admin/layouts/edit/[key]", controller="CMSLayouts", action="edit");
	addRoute(name="reorder_layouts_path", pattern="/admin/layouts/reorder", controller="CMSLayouts", action="reorder");
	addRoute(name="layouts_path", pattern="/admin/layouts", controller="CMSLayouts", action="index");

	//  USER MANAGEMENT ROUTES
	addRoute(name="new_user_path", pattern="/admin/users/new", controller="CMSUsers", action="new");
	addRoute(name="edit_user_path", pattern="/admin/users/edit/[key]", controller="CMSUsers", action="edit");
	addRoute(name="delete_user_path", pattern="/admin/users/delete/[key]", controller="CMSUsers", action="delete");
	addRoute(name="create_user_path", pattern="/admin/users/create", controller="CMSUsers", action="create");
	addRoute(name="update_user_path", pattern="/admin/users/update/[key]", controller="CMSUsers", action="update");
	addRoute(name="users_path", pattern="/admin/users", controller="CMSUsers", action="index");

	//  ADMIN HOME
	addRoute(name="admin_path", pattern="/admin", controller="CMSPages", action="index");

	//  THIS ROUTE IS WHAT DISPLAYS OUR PAGES FOR US
	addRoute(name="viewer", pattern="[parent]/subpage1/subpage2/[slug]", controller="CMSViewer", action="index");
	addRoute(name="viewer", pattern="[parent]/subpage1/[slug]", controller="CMSViewer", action="index");
	addRoute(name="viewer", pattern="[parent]/[slug]", controller="CMSViewer", action="index");
	addRoute(name="viewer", pattern="/[slug]", controller="CMSViewer", action="index");

	  //  HOME ROUTE
	addRoute(name="home", pattern="", controller="CMSViewer", action="index");
</cfscript>