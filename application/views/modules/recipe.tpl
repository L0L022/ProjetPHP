{extends file="../layout.tpl"} {block name="body"}

{if isset($idc)}

 <div class="ui divided link items">
   {foreach $recipes.$idc as $c}
   <a class="item" href="{site_url('recipe/')}{$c.id}">
    <div class="ui small rounded image">
     <img src="{base_url('media/categories/')}{$c.illustration}">
    </div>
    <div class="middle aligned content">
     <div class="header">{$c.name}</div>
     <div class="description">
      <p>{$c.description}</p>
     </div>
    </div>
   </a>
   {/foreach}
  </div>


{else}
 <div class="ui divided link items">
  {foreach $categories as $c}
  <a class="item" href="{site_url('recipe/category/')}{$c.id}">
   <div class="ui small rounded image">
    <img src="{base_url('media/categories/')}{$c.illustration}">
   </div>
   <div class="middle aligned content">
    <div class="header">{$c.name}</div>
    <div class="description">
     <p>{$c.description}</p>
    </div>
   </div>
  </a>
  {/foreach}
 </div>
{/if}

{/block}
