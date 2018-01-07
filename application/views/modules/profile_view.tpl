{extends file="../layout.tpl"}
{block name="body"}
<div class="ui center aligned segment">
  <h2 class="ui header">Profil</h2>
</div>

<div class="ui grid">
  <div class="five wide column">
    <div class="ui black top attached segment">
      <img class="ui medium rounded image" src="{if $user.avatar eq ''}{base_url('media/avatars/Default.png')}{else}{base_url('media/avatars/')}{$user.avatar}{/if}">
      <h2>{$user.name} {$user.firstname}</h2>
      <h4>{$user.login}</h4>
      <form method="get" action="{site_url('profile/edit/')}{$user_id}">
          <button class="ui basic black fluid button" type="submit">Editer profil</button>
      </form>
      </br>
      <form method="get" action="{site_url('profile/avatar/')}{$user_id}">
          <button class="ui basic black fluid button" type="submit">Modification avatar</button>
      </form>
    </br>
      <form method="get" action="{site_url('profile/password/')}{$user_id}">
          <button class="ui basic fluid black button" type="submit">Changer mot de passe</button>
      </form>
    </br>
      <form method="get" action="{site_url('profile/delete/')}{$user_id}">
          <button class="ui basic fluid red button" type="submit">Supprimer mon compte</button>
      </form>
    </div>
  </div>
  <div class="eleven wide column">

    <div class="ui yellow top attached segment">
      <div class="ui grid">
        <div class="row">
          <div class="twelve wide column">
              <p>Nombre de recettes : </p>
          </div>
          <div class="four wide column">
            <form method="get" action="{site_url('recipe/edit/1')}">
                <button class="ui inverted green button" type="submit">Nouvelle recette</button>
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="ui grey attached segment">
      <div class="ui divided link items">
      {foreach $user.recettes as $value}
      <a class = "item" href="{site_url('recipe/view/')}{$value.id}">
          <div class="ui internally celled grid">
            <div class="row">
              <div class="four wide column">
                <img class="ui fluid rounded image" src="{base_url('media/categories/')}{$value.illustration}">
              </div>
              <div class="nine wide column">
                <div class="middle aligned content">
                <h4 class="ui black header">{$value.title}</h3>
                <h5 class="ui black header">{$value.description}</h4>
              </div>
              </div>
              <div class="three wide column">
                  <form method="get" action="{site_url('recipe/edit/1')}">
                    <button class="fluid positive ui button">Modifier</button>
                  </form>
                </br>
                  <form method="get" action="{site_url('recipe/edition')}">
                    <button class="fluid negative ui button">Supprimer</button>
                  </form>
              </div>
            </div>
          </div>
      </a>
      {/foreach}
    </div>
  </div>
</div>

{*dessert = blanc repas = marron entrée = green *}
{/block}
