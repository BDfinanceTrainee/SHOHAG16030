var token = sessionStorage.getItem('accessToken');
var userId = sessionStorage.getItem('userId');
$(document).ready(function () {
    $('.pagetitle h1').each(function () {
        var text = $(this).text();
        $(this).text(text.replace('HRM', 'Company'));
    });
    $("#company-name").on('input', function () {
        ivalidator.hideMessages();
    });
    $("#company-address").on('input', function () {
        ivalidator.hideMessages();
    });
    var staticNotification = $("#staticNotification").kendoNotification({
        appendTo: "#appendto",
        autoHideAfter: 6000,
        button: true,
        hideOnClick: true
          
    }).data("kendoNotification");
     var staticNotification_u = $("#staticNotification-u").kendoNotification({
        appendTo: "#appendtou",
        autoHideAfter: 6000,
        button: true,
        hideOnClick: true
          
    }).data("kendoNotification");
    var currentDate = new Date(),
        day = currentDate.getDate(),
        month = currentDate.getMonth() + 1,
        year = currentDate.getFullYear();
    var t = year + "-" + month + "-" + day;
    $('#company-address').keypress(function (event) {
        if (event.keyCode == 13) {
            event.preventDefault();
            $('#Save').click();
        }
    });
    $('#Save').unbind().bind('click', function (e) {
        e.preventDefault();
        var ivalidator = $("#companyForm-insert").kendoValidator().data("kendoValidator");
        var d = t;
        var container = $(staticNotification.options.appendTo);
        container.scrollTop(container[0].scrollHeight);
        e.preventDefault();
        if (ivalidator.validate()) {
            $.ajax({

                url: "http://120.50.19.10:99/api/CompanyApi",

                type: 'POST',

                dataType: 'json',

                data: { //Passing data
                    company_name: $("#company-name").val(), //Reading text box values using Jquery
                    company_address: $("#company-address").val(),
                    added_by: userId,
                    added_date: d.toString()
                },
                beforeSend: function (xhr) {
                    var auth = 'Bearer ' + token;
                    xhr.setRequestHeader('Authorization', auth);
                },
                success: function (data) {
                    staticNotification.show(data.company_name + "<br/>" + "saved successfully!");
                    $("#company-name").focus();
                    $("#companyForm-insert")[0].reset();
                    $("#grid").data("kendoGrid").dataSource.read();
                },
                error: function (xhr, errorType, exception) {
                    var responseText = jQuery.parseJSON(xhr.responseText);
                    staticNotification.show(responseText.Message, "warning");
                }                   
            });
        }
    });

    $("#toolbar").kendoToolBar({
        items: [
            { type: "button", text: "Add Company", id: "undo", icon: "k-icon k-add" }
        ]
    });
    $("#undo").click(function () {
        $("#companyForm-insert")[0].reset();
        $("#window-insert").data("kendoWindow").title("Add Company");
        $("#window-insert").data("kendoWindow").center().open();
        $("#undo").fadeOut();
    });

    function onClose() {            
        $("#undo").fadeIn();
    }
    $(".close-button").click(function () {            
        $(this).closest("[data-role=window]").data("kendoWindow").close();
    });
    $("#window-insert").kendoWindow({
        width: "600px",
        resizable: false,
        scrollable: false,
        actions: [           
            "Close"
        ],
        position: {
            //top: "15%",
            //left: "25%"
        },
        close: onClose
    }).data("kendoWindow");
    $("#window-update").kendoWindow({
        width: "600px",
        resizable: false,
        scrollable: false,
        actions: [
            "Close"
        ],
        position: {
            //top: "15%",
            //left: "25%"
        },
        close: onClose
    }).data("kendoWindow");
    //data source for kendo grid
    dataSource = new kendo.data.DataSource({
        autoBind:true,
        transport: {
            read:
            {
                url: "http://120.50.19.10:99/api/CompanyApi",
                dataType: "json",                  
                beforeSend: function (xhr) {
                    var auth = 'Bearer ' + token;
                    xhr.setRequestHeader('Authorization', auth);
                }
            },
                
            update:
            {
                url: "http://120.50.19.10:99/api/CompanyApi",
                dataType: "json",
                type: "PUT"
            }
                
        },
        schema:
        {
            model:
            {
                id: "company_id",
                fields: {   //column models and specifying behaviour
                    company_id: { editable: false, nullable: false, type: "number" },
                    company_name: { editable: true, nullable: false, type: "string" },
                    company_address: { editable: true, nullable: false, type: "string" }
                }
            }
        },
        pageSize: 10
    });
    $("#grid").kendoGrid({
        dataSource: dataSource, //binging the above data source to grid
        //editable: "inline",   //inline editing
        selectable: true,       //selectable when u click on any row its color may change
        groupable: true,
        sortable: true,//sortable
        columns: [
            {
                field: "company_id",
                title: "Company Code",
                width: "120px",
                media: "(min-width: 850px)"
            },//columns in grid
            {
                field: "company_name",
                title: "Company Name",
                width: "250px",
                media: "(min-width: 850px)"
            },
            {
                field: "company_address",
                title: "Company Address",
                width: "300px",
                media: "(min-width: 850px)"
            },
            {
                command: { text: "Edit", className: "editButton", imageClass: "k-icon k-i-pencil ob-icon-only" }, title: "Action", width: "110px"
            }
        ],
           
        filterable: true,       //we can filter tae data using filter options
        columnMenu: true,
        reorderable: true,           
        resizable: true,           
        pageable: {
            refresh: true,
            pageSize: true,
            pageSizes: [5, 10, 25, 50, 100, "All"],
            messages: {
                itemsPerPage: "Companies",
                display: "{0}-{1} from {2} Companies",
                empty: "No Company Found",
                allPages: "Show All"
            }
        }
    }).data("kendoGrid");
    $('#company-address-u').keypress(function (event) {
        if (event.keyCode == 13) {
            event.preventDefault();
            $('#Update').click();
        }
    });
    var myVar = null;
    $("#grid").delegate(".editButton", "click", function (e) {
        var d = t;
        var grid = $("#grid").data("kendoGrid");
        myVar = grid.dataItem($(this).closest("tr"));
        $("#company-name-u").val(myVar.company_name);
        $("#company-address-u").val(myVar.company_address);
        $("#window-update").data("kendoWindow").title("Update Company");
        $("#window-update").data("kendoWindow").center().open();            
        $("#Update").unbind().bind('click', function (e) {
            e.preventDefault();
            var uvalidator = $("#companyForm-update").kendoValidator().data("kendoValidator");
            if (uvalidator.validate()) {                    
                $.ajax({
                    url: "http://120.50.19.10:99/api/CompanyApi",
                    type: 'PUT',
                    data: { //Passing data
                        company_id: myVar.company_id,
                        company_name: $("#company-name-u").val(), //Reading text box values using Jquery                        
                        company_address: $("#company-address-u").val(),
                        added_by:myVar.added_by,
                        added_date:myVar.added_date,
                        update_by: userId,
                        update_date: d.toString()
                    },
                    beforeSend: function (xhr) {
                        var auth = 'Bearer ' + token;
                        xhr.setRequestHeader('Authorization', auth);
                    },
                    success: function (data) {
                        $("#grid").data("kendoGrid").dataSource.read();
                        $("#window-update").data("kendoWindow").close();
                                                     
                    },
                    error: function (xhr, errorType, exception) {
                        var responseText = jQuery.parseJSON(xhr.responseText);
                        staticNotification_u.show(responseText.Message, "warning");
                    }                       
                });
            }
               
        });
        $(e.target).closest("tr").addClass("k-state-selected");
    });        
});  
