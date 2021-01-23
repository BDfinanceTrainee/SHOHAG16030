$(document).ready(function(){
    KendoUIAppBerHelper.GeneratekendoAppBar();
})

var KendoUIAppBerHelper = {
    GeneratekendoAppBar: function () {

        $("#appbar").kendoAppBar({
            items: [
                {
                    template: "<span><input /><span>"
                }
            ],
            themeColor: "dark"
        });
    }
}