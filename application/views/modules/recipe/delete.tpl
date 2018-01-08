{extends file="../../layout.tpl"}

{block name="css"}
<link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}
<div class="ui center aligned segment">
  <div class="ui grid">
    <div class="row">
      <div class="four wide column">
        <form method="get" action="{site_url('profile/view/')}{$recipe.creator}">
          <button class="ui small basic labeled icon button">
            <i class="left chevron icon"></i>
            Retour vers Profil
          </button>
        </form>
      </div>
      <div class="eight wide column">
        <h2 class="ui header">Supprimer la recette {$recipe.title}</h2>
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
        Êtes-vous sûr de supprimer votre recette ? </br>
        </br>
        </br>
       <div class="ui checkbox">
         <input name="confirmation" type="checkbox">
         <label>Oui, je confirme.</label>
       </div>
       </br>
       </br>
        <input type="submit" name="delete" value="Supprimer" class="ui fluid large red button">
      </br>
      </div>
      <div class="ui success message">
        <p>Votre recette à été supprimé.</p>
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
