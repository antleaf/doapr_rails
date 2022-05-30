// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
import "controllers"
import jquery from 'jquery'
import DataTable from 'datatables'
import Rails from '@rails/ujs';
// import bootstrap from 'bootstrap';
import * as bootstrap from "bootstrap"
Rails.start();

window.jQuery = jquery
window.$ = jquery

window.DataTable = DataTable();

$('document').ready(function() {
    $('.unsorted-table').dataTable({
        "bSort": false,
        "bInfo": false,
        "bFilter": false,
        "bPaginate": false,
        "fixedHeader": false,
        "order": [[0, "asc"]]
    });
});

$('document').ready(function() {
    $('.sorted-table').dataTable({
        "bSort": true,
        "bInfo": false,
        "bFilter": false,
        "bPaginate": false,
        "fixedHeader": false,
        "order": [[0, "asc"]],
        "columnDefs": [{targets: ['unsorted-column','actions'], orderable: false}],
        stateSave: true
    });
});

$('document').ready(function() {
    $('.reverse-sorted-table').dataTable({
        "bSort": true,
        "bInfo": false,
        "bFilter": false,
        "bPaginate": false,
        "fixedHeader": false,
        "order": [[0, "desc"]],
        "columnDefs": [{targets: ['unsorted-column','actions'], orderable: false}],
    });
});

// $(".alert" ).fadeOut(4000);