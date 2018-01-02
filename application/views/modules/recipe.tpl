{extends file="../layout.tpl"} {block name="body"}

{if isset($idc)}
<div class="ui divided link items">
  {foreach $recipes as $r}
  <a class="item" href="{site_url('recipe/id/')}{$r.id}">
    <div class="ui small rounded image">
      <img src="{base_url('media/categories/')}{$r.illustration}">
    </div>
    <div class="middle aligned content">
      <div class="header">{$r.title}</div>
      <div class="description">
        <p>{$r.description}</p>
      </div>
    </div>
  </a>
  {/foreach}
</div>

{elseif isset($idr)}
<div class="ui horizontal segments">
  <div class="ui segment">
    <h1>{$recipe.title}</h1>
  </div>
  <div class="ui center aligned segment">
    <p>Créer le {$recipe.date_create}</p>
  </div>
  <div class="ui segment">
    <p>Modifier le {$recipe.date_modif}</p>
  </div>
</div>

<div class="ui green segment">
  <div class="ui internally celled grid">
    <div class="row">
      <div class="four wide column">
        <img class="ui fluid rounded image" src="{base_url('media/categories/')}{$recipe.illustration}">
      </div>
      <div class="twelve wide column">
        <p>Te eum doming eirmod, nominati pertinacia argumentum ad his. Ex eam alia facete scriptorem, est autem aliquip detraxit at. Usu ocurreret referrentur at, cu epicurei appellantur vix. Cum ea laoreet recteque electram, eos choro alterum definiebas
          in. Vim dolorum definiebas an. Mei ex natum rebum iisque.</p>
      </div>
    </div>
  </div>
</div>


<div class="ui horizontal segments">
  <div class="ui black segment">
    <p><i class="disabled users icon"></i> Recette pour {$recipe.result_amount} {$recipe.result_label}</p>
  </div>
  <div class="ui black segment">
    <p><i class="hourglass half icon"></i> {$recipe.time_preparation} sec de preparation</p>
  </div>
  <div class="ui black segment">
    <p><i class="hourglass half icon"></i> {$recipe.time_cooking} sec pour cuire</p>
  </div>
  <div class="ui black segment">
    <p><i class="wait half icon"></i> {$recipe.time_rest} sec de repos</p>
  </div>
</div>

<div class="ui grid">
  <div class="three wide column">
    <div class="ui red segment">
      {for $foo=1 to 8}
      <p> <i class="hourglass half icon"></i> 6 bananes </p>
      {/for}
    </div>
  </div>
  <div class="thirteen wide column">
    <div class="ui yellow segment">
      {for $foo=1 to 5}

      <h3>Etape {$foo}</h3>
      <p>Truc muche bidule</p>

      {/for}
    </div>
  </div>
</div>

{else}
<div class="ui divided link items">
  {foreach $categories as $c}
  <a class="item" href="{site_url('recipe/category/')}{$c.id}">
    <div class="ui small rounded image">
      <img src="{base_url('media/categories/')}{$c.illustration}">
    </div>
    <div class="middle aligned content">
      <div class="header">{$c.label}</div>
      <div class="description">
        <p>{$c.description}</p>
      </div>
    </div>
  </a>
  {/foreach}
</div>
{/if} {/block}
