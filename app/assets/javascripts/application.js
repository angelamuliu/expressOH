// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });


$(document).ready(function() {

    // Navigation visibility toggle
    $("#gear").click(function() {
        var gear_nav = $("#gear_nav");
        if (gear_nav.hasClass("hidden")) { // Show
            gear_nav.slideDown(80);
            gear_nav.removeClass("hidden");
        } else { // Hide
            gear_nav.slideUp(80, function() {
                gear_nav.addClass("hidden");
        })}
    });

    // 
    $("#menu label").click(function() {
        var checked = $(this).children("input")[0].checked
        var item_price = parseFloat(this.querySelector("span").innerHTML.replace(/[($)]/g, ""));
        var total_price_before = parseFloat($("#total_price h3 span")[0].innerHTML.replace(/[($)]/g, ""));
        var updated_price;
        // debugger;
        if (checked) { // Added a menu item
            updated_price = total_price_before + item_price;
        } else { // Removed a menu item 
            updated_price = total_price_before - item_price;
        }
        $("#total_price h3 span")[0].innerHTML = "$" + updated_price.toFixed(2);
    })

})

