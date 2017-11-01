{extends file="general_page_template.tpl"}
{block name=title}
    {$basename|escape}
{/block}
{block name=body}
    <form id="addPage" action="create.php" method="post" enctype="multipart/form-data">
        <h1>Add New Content to a Page</h1>
        {if $security_level === 'sysop'}
            <fieldset id="addPage">
                <legend>Add HTML Page</legend>
                <input id="home" type="radio" name="page_name" value="index.php">
                <label for="home">Home</label>
                <input id="about" type="radio" name="page_name" value="about.php">
                <label for="about">About</label>
                <input id="blog" type="radio" name="page_name" value="blog.php">
                <label for="blog">Blog</label>
            </fieldset>
            <fieldset id="columnPos">
                <legend>Column Position</legend>
                <input id="left_column" type="radio" name="column_pos" value="left">
                <label for="left_column">Left</label>
                <input id="middle_column" type="radio" name="column_pos" value="middle">
                <label for="middle_column">Middle</label>
                <input id="right_column" type="radio" name="column_pos" value="right">
                <label for="right_column">Right</label>
            </fieldset>
        {/if}
        <input id="imgBtn" type="file" name="file">
        <div id="dataInputs">
            <label class="inputLabel" for="heading">Heading</label>
            <input id="heading" type="text" name="heading" value="" required>
            <label class="textareaLabel" for="content">Content</label>
            <textarea id="content" name="content"></textarea>
        </div>
        <div id="submitBlock">
            <input type="submit" name="submit" value="enter">
        </div>
        <input type="hidden" name="user_id" value="{$online_id}">
        <input type="hidden" name="action" value="add">
    </form>
{/block}
