{extends file="../../layout.tpl"}

{block name="css"}
<link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}
<div class="ui center aligned segment">
  <h2 class="ui header">Nouveau mot de passe</h2>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form {if not empty($success)}success{/if}{if not empty($errors)}error{/if}" method="post" accept-charset="utf-8">
      <div class="ui stacked segment">
       {if $old_pass}
        <div class="field {if not empty(form_error('old_pass'))}error{/if}">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="old_pass" placeholder="Ancien mot de passe" value="{'old_pass'|set_value}">
          </div>
        </div>
        {/if}
        <div class="field {if not empty(form_error('pass'))}error{/if}">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="pass" placeholder="Nouveau mot de passe" value="{'pass'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('pass2'))}error{/if}">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="pass2" placeholder="Validation du nouveau mot de passe" value="{'pass2'|set_value}">
          </div>
        </div>
        <input type="submit" name="update" value="Update" class="ui fluid large teal button">
      </div>
      <div class="ui success message">
        <p>{$success}</p>
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
