$(document).ready(function () {
    KendoUIDialogHelper.GenerateKendoUIDialgo();
})

var KendoUIDialogHelper = {
    GenerateKendoUIDialgo : function(){
        $("#dialog").kendoDialog({
            title: "Kendo Dialog Component",
            content: "This is your Kendo Dialog.",
        });
        var dialog = $("#dialog").data("kendoDialog");
        setTimeout(function () {
            dialog.close();
        }, 1000);
     
        //$("#breadcrumb").kendoBreadcrumb({
        //    value: 'Telerik UI/Navigation/Breadcrumb',
        //    click: function(e) {
        //        console.log(e.sender);
        //    }
        //});
    }
}
