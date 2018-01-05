{extends file="../layout.tpl"}
{block name="body"}

<div class="ui grid">
  <div class="five wide column">
    <div class="ui black top attached segment">
      <p>Bienvenu {$user.name} {$user.firstname}</p>
      <img class="ui small rounded image" src="/images/wireframe/square-image.png">
      <p>{$user.login} <a href='#'>Modifier login</a></p>
      <p>{$user.mail} <a href='#'>Changer d'adresse email</a></p>
    </div>
    <div class="ui attached segment">
      <div class="ui styled accordion">
        <div class="title">
          <i class="dropdown icon"></i> Parametre
        </div>
        <div class="content">
          <p class="transition hidden">A dog is a type of domesticated animal. Known for its loyalty and faithfulness, it can be found as a welcome guest in many households across the world.</p>
        </div>
      </div>
    </div>
  </div>
  <div class="eleven wide column">

    <div class="ui yellow top attached segment">
      <p>Nombre de recettes : </p>

      <div class="ui search">
        <div class="ui icon input">
          <input class="prompt" placeholder="Common passwords..." type="text">
          <i class="search icon"></i>
        </div>
        <div class="results"></div>
      </div>
    </div>

    <div class="ui grey attached segment">
      {foreach $user.recettes as $value}
      <a href="{site_url('recipe/id/')}{$value.id}">
        <div class="ui green segment">
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
        </div>
      </a>
      {/foreach}
    </div>
  </div>
</div>



{*dessert = blanc repas = marron entrée = green *}
{/block}
