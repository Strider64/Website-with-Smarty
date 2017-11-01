{extends file="general_page_template.tpl"}
{block name=meta}
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="no-cache"> 
    <meta http-equiv="Expires" content="-1"> 
    <meta http-equiv="Cache-Control" content="no-cache">
{/block}
{block name=title}
    {$basename|escape}
{/block}
{block name=body}
    <div id="website" class="container" data-bind="{$user_id}">
        <div id="blogPostings" class="span8">
            {include file='cms_template_inc.tpl' column="left" online_id=$online_id}
        </div>
        <div id="ajaxPostings" class="span8">

        </div>            
        <div id="blogInfo" class="span4">
            <h2>The Daily Blog</h2>
            {nocache}
                <form id="selectBlog" action = "{$basename}" method = "post">
                    <input type="hidden" name="action" value="selection">
                    <input id="statusCheck" type="hidden" name="status" value="{$login_status}">
                    <label>Select User</label>
                    <div id="selectUser">

                        {html_options id="selectBtn" name=user_id options=$myOptions selected=$mySelect nocache}

                    </div>
                    <input id="blogSubmitBtn" type = "submit" name = "my_submit" value = "submit button">
                </form>
            {/nocache}
            <p>This is a FREE blog that anyone can use and you can keep it private for your eyes only. Note, I have the right to check the private posts after all I am running this website, so don't write anything of  a confidential nature. Though hopefully you will make it public for everyone to see. To write a new post to your blog you must be logged in and then simply click the button below (it will show up when you're logged in). I have made it where you can change your privacy mode right here on this blog page. </p>

            {nocache}
            {if $login_status}
                <a id="blogButton" href="create.php">new blog</a>
                <form id="private"  action="{$basename}" method="post">
                    <h2>Private Posts is Turned </h2>
                    <div class="slideThree">
                        <input type="hidden" name="action" value="enter">
                        <input id="slideThree" type="checkbox" name="private"  value="on" {$checked}>
                        <label class="radioLabel" for="slideThree"></label>                        
                    </div>
                    <input id="privateBtn" type="submit" name="enter" value="change">
                </form>
            {/if}
            {/nocache}

        </div>
    </div>
{/block}
{block name=footer}
    <footer class="footer-style">
        <p class="footer-name">&copy;2017<span>  John R. Pepp</span></p>
    </footer>
    <script src="assets/js/blog-user-selection.js"></script>
{/block}