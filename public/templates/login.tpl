{extends file="general_page_template.tpl"}
{block name=title}
    {$basename|escape}
{/block}
{block name=body}
    <div class="loginPage">
        {if !$invalid }
            <div id="login_section">
                <article>
                    <h1>Login Section</h1>
                    {if $message}
                        <p>{$message}</p>
                    {else}
                        <p>This is where you login in to gain access to member only pages. This website is using a new and improved PHP login system that improves security of users personal information.</p>
                    {/if}
                </article>
                <form id="login" action="{$basename}" method="post" autocomplete="off">
                    <fieldset>
                        <legend>Sign-in to Your Account</legend>
                        <input type="hidden" name="action" value="login">
                        <label for="username">username</label>
                        <input id="username" type="text" name="username" value="" tabindex="1">
                        <label for="password">password</label>
                        <input id="password" type="password" name="password" tabindex="2">
                        <input type="submit" name="submit" value="login" tabindex="3">
                    </fieldset>
                </form>
            </div>

        {else}
            <div id="login_section">
                <article>
                    <h1 class="errorHeader">Errors in Registration Form</h1>
                    <p class="error">All input fields must be entered</p>
                    <p class="error">Invalid Username, please re-enter!</p>
                    <p class="error">Invalid Password, please re-enter!</p>
                    <p class="error">Passwords Do Not match, please re-enter!</p>
                    <p class="error">Invalid Email, please re-enter!</p>
                    <p class="error">Email Addresses Do Not Match, please re-enter!</p>
                </article>
            </div>
        {/if}

        <div id="register_section">
            <article>
                <h1>Registration Section</h1>
                <p>Not a member? No problem! Just register using the form below and you will become a member in no time.</p>
            </article>
            <form id="register" name="<?php $basename; ?>" method="post" autocomplete="off">
                <fieldset>
                    <legend>Registration Form</legend>
                    <input type="hidden" name="action" value="register">
                    <label for="register_username">username</label>
                    <input id="register_username" type="text" name="username" value="" tabindex="4">
                    <label for="register_password">password</label>
                    <input id="register_password" type="password" name="password" tabindex="5">
                    <label for="register_verify">verify password</label>
                    <input id="register_verify" type="password" name="verify_password" tabindex="6">
                    <label for="full_name">Full Name</label>
                    <input id="full_name" type="text" name="full_name" value="" tabindex="7">
                    <label for="email">email</label>
                    <input id="email" type="email" name="email" value="" tabindex="8">
                    <label for="verify_email">verify email</label>
                    <input id="verify_email" type="email" name="verify_email" value="'" tabindex="9">
                    <h2>Do you want your posts seen?</h2>
                    <div class="slideThree">
                        <input id="slideThree" type="checkbox" name="private" checked value="yes">
                        <label class="radioLabel" for="slideThree"></label>
                    </div>
                    <input type="submit" name="submit" value="submit" tabindex="10">
                </fieldset>
            </form>

        </div>
    </div>
{/block}