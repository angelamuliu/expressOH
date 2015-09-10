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

function resizeBeans() {
    console.log($(window).width());
    if ($(window).width() < 800) {
        $("div.bean-background").height($(window).height() / 3);
    } else {
        $("div.bean-background").height($(window).height() / 2);
    }
    // $("div.intro").height(($("div.bean-background").height());
}


$(document).ready(function() {

    resizeBeans();

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

    $(window).bind('resize', function() {
        resizeBeans();
    });

})

