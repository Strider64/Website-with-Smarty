{extends file="general_page_template.tpl"}
{block name=title}
    {$basename|escape}
{/block}
{block name=body}
    <div class="container">
        {$calendar}
    </div>
{/block}
{block name=footer}
    <footer class="footer-style">
        <p class="footer-name">&copy;2017<span>  John R. Pepp</span></p>
    </footer>
    <script src="assets/js/blog-user-selection.js"></script>
{/block}