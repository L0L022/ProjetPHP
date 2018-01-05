{extends file="../layout.tpl"}
{block name="body"}

<div class="ui grid">
  <div class="five wide column">
    <div class="ui black top attached segment">
      <img class="ui medium rounded image" src="/images/wireframe/square-image.png">
      <h2>{$user.name} {$user.firstname}</h2>
      <h4>{$user.login}</h4>
      <form method="get" action="{site_url('profile/edite_profil')}">
          <button class="ui basic black button" type="submit">Editer profil</button>
      </form>
    </div>
  </div>
  <div class="eleven wide column">

    <div class="ui yellow top attached segment">
        <p>Nombre de recettes : </p>
        <form method="get" action="{site_url('recipe/edition')}">
            <button class="ui inverted green button" type="submit">Nouvelle recette</button>
        </form>
    </div>
    <div class="ui grey attached segment">
      <div class="ui divided link items">
      {foreach $user.recettes as $value}
      <a class = "item" href="{site_url('recipe/id/')}{$value.id}">
          <div class="ui internally celled grid">
            <div class="row">
              <div class="four wide column">
                <img class="ui fluid rounded image" src="{base_url('media/categories/')}{$value.illustration}">
              </div>
              <div class="twelve wide column">
                <h5>{$value.name}</h5>
                <p>{$value.description}</p>
                <div class="ui basic right aligned segment">
                  <button class="positive ui button">Modifier</button>
                  <button class="negative ui button">Supprimer</button>
                </div>
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
