<a class="{if $page eq 'home'}active{/if} item" href="{site_url('home')}">
  Accueil
</a>
<a class="{if $page eq 'recipe'}active{/if} item" href="{site_url('recipe')}">
  Recettes
</a>
{if $user_id !== null}
<a class="{if $page eq 'profile'}active{/if} item" href="{site_url('profile')}">
  Espace perso
</a>
{/if}
<div class="right menu">
  <div class="ui category search item">
    <div class="ui transparent icon input">
      <input class="prompt" placeholder="Rechercher une recette..." type="text">
      <i class="search link icon"></i>
    </div>
    <div class="results"></div>
  </div>
  {if $user_id === null}
  <form action="{site_url('connection')}" method="post" accept-charset="utf-8">
    {if $page !== 'connection'}
    <input type="hidden" name="disable_form_validation">
    {/if}
    <input type="hidden" name="redirect" value="{uri_string()}">
    <input class="ui {if $page eq 'connection'}active{/if} item" type="submit" value="Connexion">
  </form>
  {else}
  <form action="{site_url('connection/logout')}" method="post" accept-charset="utf-8">
    <input type="hidden" name="redirect" value="{uri_string()}">
    <input class="ui item" type="submit" value="Déconnexion">
  </form>
  {/if}
</div>
