{extends file="../../layout.tpl"}

{block name="css"}
<link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}
<div class="ui center aligned segment">
  <div class="ui grid">
    <div class="row">
      <div class="four wide column">
        <form method="get" action="{site_url('profile/view/')}{$id}">
          <button class="ui small basic labeled icon button">
            <i class="left chevron icon"></i>
            Retour vers profil
          </button>
        </form>
      </div>
      <div class="eight wide column">
        <h2 class="ui header">Nouveau mot de passe</h2>
      </div>
      <div class="four wide column">
      </div>
    </div>
  </div>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form {if not empty($success)}success{/if}{if not empty($errors)}error{/if}" method="post" accept-charset="utf-8">
      <div class="ui stacked segment">
        <div class="field {if not empty(form_error('pass'))}error{/if}">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="pass" placeholder="Mot de passe" value="{'pass'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('pass2'))}error{/if}">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="pass2" placeholder="Validation de mot de passe" value="{'pass2'|set_value}">
          </div>
        </div>
        <input type="submit" name="update" value="Modifier" class="ui fluid large teal button">
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
