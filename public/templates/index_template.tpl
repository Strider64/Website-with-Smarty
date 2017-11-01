{extends file="general_page_template.tpl"}
{block name=title}
    {$basename|escape}
{/block}


{block name=body}
    <div id="website" class="container">
        <div class="span6">
            {include file='cms_template_inc.tpl' column="left" online_id=$online_id}
        </div>
        <div class="span6">
            {include file='cms_template_inc.tpl' column="right" online_id=$online_id}
        </div>
    </div>
{/block}
{block name=footer}
    <footer class="footer-style">
        <p class="footer-name">&copy;2017<span>  John R. Pepp</span></p>
    </footer>
{/block}