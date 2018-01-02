{extends file="../layout.tpl"}
{block name="body"}


<div class="ui grid">
  <div class="five wide column">
    <div class="ui black segment">
      <p>Bienvenu {$user.name} {$user.firstname}</p>
      <p>Voici votre login --> {$user.login}</p>
      <p>Voici votre email --> {$user.mail}</p>
      <p>Voici votre mot de passe --> {$user.pwd}</p>
      <p>Voici votre avatar --> {$user.avatar}</p>
    </div>
  </div>
  <div class="eleven wide column">

    <div class="ui yellow top attached segment">
      <p>This segment is on top</p>
    </div>
    {*<div class="ui attached segment">
      {foreach $user.recettes as $value}
        <div class="ui brown segment">
          <a href="{site_url('recipe/id/')}{$value.id}">{$value.name}</a></br>
        </div>
      {/foreach}
    </div>
  </div>*}

  <div class="ui attached segment">
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
            </div>
          </div>
        </div>
      </div>
    </a>
    {/foreach}
  </div>
  </div>
</div>



{*dessert = blanc
repas = marron
entrée = green
*}

{/block}
