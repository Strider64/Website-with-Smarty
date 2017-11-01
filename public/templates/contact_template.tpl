{extends file="general_page_template.tpl"}
{block name=title}
    {$basename|escape}
{/block}
{block name=body}
    <div id="contact-form">
        <form id="contact" name="contact" action="contact.php" method="post"  autocomplete="on">
            <fieldset>
                <legend>{$success}</legend>
                <input type="hidden" name="token" value="{$token}">
                <label for="name" accesskey="U">Name</label>
                <input name="name" type="text" id="name" tabindex="1" autofocus required="required" />

                <label for="email" accesskey="E">Email</label>
                <input name="email" type="email" id="email" tabindex="2" required="required" />

                <label for="phone" accesskey="P" >Phone <small>(optional)</small></label>
                <input name="phone" type="tel" id="phone" tabindex="3">

                <label for="web" accesskey="W">Website <small>(optional)</small></label>
                <input name="website" type="text"  id="web" tabindex="4">

                <div class="radioBlock">
                    <input type="radio" id="radio1" name="reason" value="message" tabindex="5" checked>
                    <label class="radioStyle" for="radio1">message</label>
                    <input type="radio" id="radio2" name="reason" value="order">
                    <label class="radioStyle" for="radio2">order</label>  
                    <input type="radio" id="radio3" name="reason" value="status">
                    <label class="radioStyle" for="radio3">status inquiry</label>    
                </div>

                <label class="textBox" for="comments">Comments</label>
                <textarea name="comments" id="comments" spellcheck="true" tabindex="6" required="required"></textarea> 
                <div class="g-recaptcha" data-sitekey="6LfPlQoUAAAAAPgD3PpnQ_uGTzc87UALiFgQ3XnK"></div>
                <input type="submit" name="submit" value="submit" tabindex="7">
            </fieldset>
        </form>
    </div>    
{/block}
{block name=footer}
    <footer class="footer-style">
        <p class="footer-name">&copy;2017<span>  John R. Pepp</span></p>
    </footer>
{/block}