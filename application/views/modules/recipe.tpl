{extends file="../layout.tpl"} {block name="body"}

{if isset($idc)}

 <div class="ui divided link items">
   {foreach $recipes.$idc as $c}
   <a class="item" href="{site_url('recipe/id/')}{$c.id}">
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

{elseif isset($idr)}


    <h5 class="ui top attached header">
    <div class="ui huge header">{$recipe.title}</div>
    </h3>
    <div class="ui attached segment">
      <img class="ui medium left image" src="{base_url('media/categories/')}{$recipe.illustration}">
      <p>Te eum doming eirmod, nominati pertinacia argumentum ad his. Ex eam alia facete scriptorem, est autem aliquip detraxit at. Usu ocurreret referrentur at, cu epicurei appellantur vix. Cum ea laoreet recteque electram, eos choro alterum definiebas in. Vim dolorum definiebas an. Mei ex natum rebum iisque.</p>
    </div>

    <h5 class="ui attached header">
      <i class="disabled users icon"></i> Recette pour {$recipe.result_amount} {$recipe.result_label}
    </h5>
    <div class="ui attached segment">
      <p>Dogs are one type of animal</p>
    </div>

<h5 class="ui attached header">
    <div class="ui horizontal segments">
      <div class="ui segment">
        <p>Top</p>
      </div>
      <div class="ui segment">
        <p>Middle</p>
      </div>
      <div class="ui segment">
        <p>Bottom</p>
      </div>
    </div>
</h5>

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
