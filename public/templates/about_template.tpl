{extends file="general_page_template.tpl"}
{block name=title}
    {$basename|escape}
{/block}
{block name=body}
    <div id="website" class="container">
        <div class="span6">
            {include file='cms_template_inc.tpl' column="left"}
        </div>
        <div class="span6">
            <article class="cms">
                <h2>Interesting and Useful Links!</h2>
                <h3 class="subheading">Created on Tuesday, July 25, 2017 by John Pepp</h3>
                <figure class="imageStyle">
                    <img src="assets/images/img-computer-mouse.png" alt="Links">
                    <figcaption>&nbsp;</figcaption>
                </figure>
                <p>I'm posting some external links to websites that I feel will benefit a fellow developer just starting off in developing and designing websites. The first link is to my repository at Github of this very website and here's the link:
                    <a class="links" href="https://github.com/Strider64/Slice-of-Technology">https://github.com/Strider64/Slice-of-Technology</a>
                    Most of the the files needed to build this website is posted there except for Swiftmailer, but installing Swiftmailer should be pretty easy to do.</p>
            </article>
        </div>
    </div>
{/block}
{block name=footer}
    <footer class="footer-style">
        <p class="footer-name">&copy;2017<span>  John R. Pepp</span></p>
    </footer>
{/block}