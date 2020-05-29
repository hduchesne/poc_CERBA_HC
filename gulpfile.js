// Requires
var gulp = require('gulp');
var path = require('path');
var fs = require('fs');

// Include plugins
var plugins = require('gulp-load-plugins')();
var browserSync = require('browser-sync');

// Configuration
var PUBLIC_BASE_PATH           = './cerba-healthcare-template/src/main/resources';
// var PUBLIC_JS_PATH             = PUBLIC_BASE_PATH + 'assets/js/';
// var PUBLIC_JS_PLUGINS_PATH     = PUBLIC_BASE_PATH + 'assets/js/plugins/';
// var PUBLIC_CSS_PATH            = PUBLIC_BASE_PATH + 'assets/css/';
// var PUBLIC_FONTS_PATH          = PUBLIC_BASE_PATH + 'assets/fonts/';
var PUBLIC_IMAGES_PATH         = PUBLIC_BASE_PATH + '/images/';
// var PUBLIC_PHOTOS_PATH         = PUBLIC_BASE_PATH + 'assets/photos/';
// var PUBLIC_VIDEOS_PATH         = PUBLIC_BASE_PATH + 'assets/videos/';
// var WEBSERVER_ROOT             = '../public';
// var TEMPLATES_PATH             = 'src/views/templates/*.twig';
// var PUBLIC_HOMEPAGE            = 'homepage.html';

var FILES = {
    // IMAGES: [
    //     './cerba-healthcare-template/src/main/resources/images/*.{png,jpg,jpeg,gif,svg}'
    // ],
    ICONS: [
        './cerba-healthcare-template/src/main/resources/images/icons/*.svg'
    ]
};

gulp.task('svg', function(){
    return gulp.src( FILES.ICONS )
        .pipe(plugins.plumber())
        .pipe(plugins.svgSprite({
            mode: {
                symbol: {
                    dest: './',
                    sprite: 'sprite.svg'
                }
            }
        }))
        .pipe(gulp.dest( PUBLIC_IMAGES_PATH ));
});

// gulp.task('svg-watch',['svg'],browserSync.reload);
//
// gulp.task('watch', function () {
//     gulp.watch( FILES.ICONS , ['svg-watch']);
// });

// gulp.task('default', ['svg']);