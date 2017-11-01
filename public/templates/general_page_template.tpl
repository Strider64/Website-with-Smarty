<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="initial-scale=1.0, width=device-width" />
        <meta name="description" content="A Slice of Technology - Learning from Technology" />
        <meta name="keywords" content="tech, cms, tech news, calendar, social, technology, web development, web design, php, monthly calendar, blog, blog sites, social network, raspberry pi, social media, images photos, social sities" />
    {block name=meta}{/block} 
    <title>{block name=title}A Slice of Technology{/block}</title>
    <link rel="stylesheet" href="assets/css/stylesheet.css">
    <link rel="shortcut icon" href="favicon.ico" >
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
    {*debug*}    
    {include file='header_template_inc.tpl'}
    {include file='navigation_template_inc.tpl'}
    {block name=body}General Body HTML{/block}
    {block name=footer}
        <footer class="footer-style">
            <p class="footer-name">&copy;2017<span>  John R. Pepp</span></p>
        </footer>
    {/block}
    <script src="assets/js/mobile-nav.js"></script>
    <script src="assets/js/sticky.js"></script>
    <script src="assets/js/slideshow.js"></script>
    <script src="assets/js/GoogleAnalytics.js"></script>
    <script src="assets/js/privacy.js"></script>      
</body>
</html>
