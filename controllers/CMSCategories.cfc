<cfcomponent extends="Controller" output="false"><cfscript>

    function init() {
        filters(through="loginRequired");
    }

    function index() {
        categories = model("CMSCategory").findAll();
    }

    function new() {
        category = model("CMSCategory").new();
    }

    function edit() {
        category = model("CMSCategory").findByKey(params.key);

    	if (NOT IsObject(category)) {
    	    flashInsert(error="Category #params.key# was not found");
			redirectTo(action="index");
    	}
    }

    function create() {
        category = model("CMSCategory").new();
		category.name = params.name;
		category.save();
        option = '<option value="#category.id#">' & category.name & '</option>';
		renderText(option);
    }

    function update() {
        category = model("CMSCategory").findByKey(params.key);

        if (category.update(params.category)){
			flashInsert(success="The category was updated successfully.");
            redirectTo(action="index");
		} else {
			flashInsert(error="There was an error updating the category.");
			renderPage(action="edit");
		}
    }

    function delete() {
        category = model("CMSCategory").findByKey(params.key);

		if (category.delete()){
			flashInsert(success="The category was deleted successfully.");
            redirectTo(action="index");
		} else {
			flashInsert(error="There was an error deleting the category.");
			redirectTo(action="index");
		}
    }

</cfscript></cfcomponent>