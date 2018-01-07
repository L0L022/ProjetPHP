{extends file="../../layout.tpl"}

{block name="css"}
<link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}
<div class="ui center aligned segment">
  <h2 class="ui header">Supprimer votre compte</h2>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form {if not empty($errors)}error{/if}" method="post" accept-charset="utf-8">
      <div class="ui stacked segment">
        Êtes-vous sûr de supprimer votre compte ? </br>
        Cela supprimera toutes vos recettes mais laissera vos commentaire sur le site.
        </br>
        </br>
       <div class="ui checkbox">
         <input name="confirmation" type="checkbox">
         <label>Oui, je veux.</label>
       </div>
       </br>
       </br>
        <input type="submit" name="delete" value="Supprimer" class="ui fluid large red button">
      </br>

      <div class="ui error message">
       <ul class="list">
        {foreach $errors as $error}
        <li>{$error}</li>
        {/foreach}
       </ul>
      </div>
    </form>
      <form method="get" action="{site_url('profile/view/')}{$user_id}">
        <input type="submit" name="return" value="Annuler" class="ui fluid large green button">
      </form>
      </div>
  </div>
</div>
{/block}

{block name="javascript"}
  <script src="{base_url('assets/js/registration.js')}" charset="utf-8"></script>
{/block}
