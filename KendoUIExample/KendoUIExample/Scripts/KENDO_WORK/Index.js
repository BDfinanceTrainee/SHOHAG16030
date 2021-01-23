dataSource = new kendo.data.DataSource(
           {
               autoBind: true,
               transport: {
                   read:
                   {
                       url: '../KendoUIGrid/GetEmployees',
                       dataType: "json",
                       beforeSend: function (xhr) {
                           var auth = 'Bearer ' + token;
                           xhr.setRequestHeader('Authorization', auth);
                       }
                   },

                   //update:
                   //{
                   //    url: "",
                   //    dataType: "json",
                   //    type: "PUT"
                   //}

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
            field: "Id",
            title: "Id",
            width: "120px",
            media: "(min-width: 850px)"
        },//columns in grid
        {
            field: "Name",
            title: "Name",
            width: "250px",
            media: "(min-width: 850px)"
        },
        {
            field: "Address",
            title: "Address",
            width: "300px",
            media: "(min-width: 850px)"
        },
         {
             field: "DBO",
             title: "DBO",
             width: "300px",
             media: "(min-width: 850px)"
         },
          {
              field: "IsActive",
              title: "IsActive",
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

        


       