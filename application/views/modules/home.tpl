{extends file="../layout.tpl"}

{block name="body"}

<div class="ui center aligned segment">
  <h2 class="ui header">Accueil</h2>
</div>

<div class="ui center aligned top attached segment">
  <h2 class="ui header">Édito</h2>
</div>
<div class="ui attached segment">
  Le site de cuisine
</div>

<div class="ui center aligned top attached segment">
  <h2 class="ui header">Recettes aux hasards</h2>
</div>
<div class="ui attached segment">
  <div class="ui divided link items">
    {foreach $recipes as $r}
    <a class="item" href="{site_url('recipe/view/')}{$r.id}">
      <div class="ui small rounded image">
        <img class="ui fluid rounded image" src="{if $r.illustration eq ''}{base_url('media/illustrations/recipe.png')}{else}{base_url('media/illustrations/')}{$r.illustration}{/if}">
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
</div>

{/block}
