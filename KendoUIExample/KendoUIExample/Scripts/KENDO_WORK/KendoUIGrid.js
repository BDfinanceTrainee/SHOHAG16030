$(document).ready(function () {
    KendoUIGridHelper.GenerateKendoGrid();
});

var KendoUIGridHelper = {
    GenerateKendoGrid: function(){
        $("#gridKendoUI").kendoGrid({
            dataSource: [{ Id: 1, Name: "Tanzid", Designation: "FullStackDeveloper" },
                         { Id: 2, Name: "Rony", Designation: "Developer" },
                         { Id: 3, Name: "Tanzid", Designation: "FullStackDeveloper" },
                         { Id: 4, Name: "Rony", Designation: "Developer" },
                         { Id: 5, Name: "Tanzid", Designation: "FullStackDeveloper" },
                         { Id: 6, Name: "Rony", Designation: "Developer" },
                         { Id: 7, Name: "Tanzid", Designation: "FullStackDeveloper" },
                         { Id: 8, Name: "Rony", Designation: "Developer" }
            ],
            pageable: {
                refresh: true,
                serverPaging: true,
                serverFiltering: true,
                serverSorting : true
            },
            xheight: 450,
            filterable: true,
            sortable: true,
            columns: KendoUIGridHelper.Columns(),
            editable: false,
            navigatable: true,
            selectable : "row"
        });
    },
    Columns: function () {
        return columns = [
             { field: "Id", title: "Id", width: 50 },
             { field: "Name", title: "Name", width: 80 },
             { field: "Designation", title: "Designation", width: 80 }
                 

        ];
    }
}