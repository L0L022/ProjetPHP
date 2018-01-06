{extends file="../layout.tpl"}

{block name="css"}
<link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}
<div class="ui center aligned segment">
  <h2 class="ui header">S'enregistrer</h2>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form {if not empty($errors)}error{/if}" method="post" accept-charset="utf-8">
      <div class="ui stacked segment">
       <div class="ui checkbox">
         <input name="confirmation" type="checkbox">
         <label>Delete my profile</label>
       </div>
        <!-- <div class="ui fluid large teal submit button">Register</div> -->
        <input type="submit" name="delete" value="Supprimer" class="ui fluid large red button">
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
