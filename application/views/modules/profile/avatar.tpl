{extends file="../../layout.tpl"}

{block name="css"}
  <link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}
<div class="ui center aligned segment">
  <h2 class="ui header">Modification avatar</h2>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <img class="ui centered medium rounded image" src="{base_url('media/avatars/')}{$avatar}" alt="">
    <form class="ui large form {if not empty($errors)}error{/if}" method="post" accept-charset="utf-8" enctype="multipart/form-data">
      <div class="ui stacked segment">
        <div class="field">
            <div class="ui fluid file input action">
                <input type="text" readonly>
                <input type="file" id="file1" name="avatar" autocomplete="off">
                <div class="ui button">
                 <i class="file icon"></i>
                    Select...
                </div>
            </div>
        </div>
        <input type="submit" name="upload" value="Upload avatar" class="ui fluid large teal button">
        <br>
        {if $avatar ne ""}<input type="submit" name="remove" value="Remove avatar" class="ui fluid large teal button">{/if}
      </div>
      <div class="ui error message">
       <ul class="list">
        {foreach $errors as $error}
        <li>{$error}</li>
        {/foreach}
       </ul>
      </div>
    </form>
  </div>
</div>
{/block}

{block name="javascript"}
  <script src="{base_url('assets/js/registration.js')}" charset="utf-8"></script>
{/block}
