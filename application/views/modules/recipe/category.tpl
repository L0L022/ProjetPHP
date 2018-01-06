{extends file="../../layout.tpl"}

{block name="body"}
<div class="ui center aligned segment">
  <div class="ui grid">
    <div class="row">
      <div class="four wide column">
        <form method="get" action="{site_url('recipe')}">
          <button class="ui small basic labeled icon button">
            <i class="left chevron icon"></i>
            Retour vers categorie
          </button>
        </form>
      </div>
      <div class="eight wide column">
        <h2 class="ui header">{$category.label}</h2>
      </div>
      <div class="four wide column">
      </div>
    </div>
  </div>
</div>

<div class="ui divided link items">
  {foreach $recipes as $r}
  <a class="item" href="{site_url('recipe/view/')}{$r.id}">
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
{/block}
