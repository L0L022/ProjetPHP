{extends file="../../layout.tpl"}

{block name="body"}
<div class="ui center aligned segment">
  <h2 class="ui header">Catégories</h2>
</div>

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
{/block}
