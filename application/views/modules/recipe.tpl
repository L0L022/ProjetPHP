{extends file="../layout.tpl"} {block name="body"}

{if isset($idc)}
 <p>Category Id : {$idc}</p>
{else}
 <div class="ui divided link items">
  {foreach $categories as $c}
  <a class="item" href="?page=recipe&idc={$c.id}">
   <div class="ui small rounded image">
    <img src="media/categories/{$c.illustration}">
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
