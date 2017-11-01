{extends file="blog_template.tpl"}
{block name=blog_cms}
    {* Create a CMS Display using Smarty *}
    {foreach $content as $thread}
        {* Show only left column posts *}
        {if $thread.column_pos === $column}
            <article class="cms">
                <h2>{$thread.heading|escape}</h2>
                <h3 class="subheading">Created on {$thread.date_added} by {$thread.author|escape}</h3>
                <figure class="imageStyle">
                    <img src="{$thread.image_path}" alt="{$thread.heading|escape}">
                    <figcaption>&nbsp;</figcaption>
                </figure>
                <p>{$thread.content|escape}</p>

                {if $login_status && ($online_id === $thread.user_id)}
                    <div class="system">
                        <a class="edit" href="edit/{$thread.id}">Edit</a>                
                        <a class="delete" href="delete_page.php?id={$thread.id}" onclick="return confirm(\'Are you sure you want to delete?\')">Delete</a>
                    </div>
                {/if}

                <br>
            </article>
        {/if}
    {/foreach}
{/block}