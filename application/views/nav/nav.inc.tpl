<a class="{if $page eq 'home'}active{/if} item" href="{site_url('home')}">
  Accueil
</a>
<a class="{if $page eq 'recipe'}active{/if} item" href="{site_url('recipe/categories')}">
  Recettes
</a>
{if $user_id !== null}
<a class="{if $page eq 'profile'}active{/if} item" href="{site_url('profile/view/')}{$user_id}">
  Mon profil
</a>
{/if}
<div class="right menu">
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
