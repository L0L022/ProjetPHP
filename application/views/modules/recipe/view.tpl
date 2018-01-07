{extends file="../../layout.tpl"}

{block name="body"}
<div class="ui center aligned segment">
  <div class="ui grid">
    <div class="row">
      <div class="four wide column">
      </div>
      <div class="eight wide column">
        <h2 class="ui header">{$recipe.title}</h2>
      </div>
      <div class="four wide column">
      </div>
    </div>
  </div>
</div>
<div class="ui horizontal segments">
  <div class="ui center aligned segment">
    <p>Créer par <a href="{site_url('profile/view/')}{$recipe.user_id}">{$recipe.user_login}</a></p>
  </div>
  <div class="ui center aligned segment">
    <p>Créer le {$recipe.date_create|date_format:"%D"}</p>
  </div>
  <div class="ui center aligned segment">
    <p>Modifier le {$recipe.date_modif|date_format:"%D"}</p>
  </div>
</div>

<div class="ui green segment">
  <div class="ui internally celled grid">
    <div class="row">
      <div class="four wide column">
        <img class="ui fluid rounded image" src="{if $recipe.illustration eq ''}{base_url('media/illustrations/recipe.png')}{else}{base_url('media/illustrations/')}{$recipe.illustration}{/if}">
      </div>
      <div class="twelve wide column">
        {$recipe.description}
        <div class="ui horizontal segments">
          <div class="ui black segment">
            <p>{if $recipe.result_type eq "person"}<i class="disabled users icon"></i> Recette pour {$recipe.result_amount} personnes {else}<i class="disabled cubes icon"></i> Recette pour {$recipe.result_amount} unitées{/if}</p>
          </div>
          <div class="ui black segment">
            <p><i class="hourglass half icon"></i> {$recipe.time_preparation|date_format:'%H'}h{$recipe.time_preparation|date_format:'%M'} de preparation</p>
          </div>
          <div class="ui black segment">
            <p><i class="hourglass half icon"></i> {$recipe.time_cooking|date_format:'%H'}h{$recipe.time_cooking|date_format:'%M'} pour cuire</p>
          </div>
          <div class="ui black segment">
            <p><i class="wait half icon"></i> {$recipe.time_rest|date_format:'%H'}h{$recipe.time_rest|date_format:'%M'} de repos</p>
</div>
</div>
      </div>
    </div>
  </div>
</div>

<div class="ui grid">
  <div class="three wide column">
    <div class="ui red segment">
      {foreach $ingredients as $i}
       <p> <i class="hourglass half icon"></i> {$i.label} {$i.jiru_quantity} {$i.unit_short_label}</p>
      {/foreach}
    </div>
  </div>
  <div class="thirteen wide column">
    <div class="ui yellow segment">
      {$recipe.explanation}
    </div>
  </div>
</div>

<div class = "ui center aligned top attached segment">
  <h2 class="ui header">Espace commentaire</h2>
</div>
<div class = "ui attached segment">
  {if $user_id !== null}
 <form class="ui large form {if not empty($errors)}error{/if}" method="post" accept-charset="utf-8">
   <div class="ui stacked segment">
     <div class="field {if not empty(form_error('comment'))}error{/if}">
       <label for="title">Commentaire</label>
       <textarea rows="5" cols="50" name="comment" placeholder="Commentaire">{'comment'|set_value}</textarea>
     </div>
     <input type="submit" name="new_comment" value="Ajouter" class="ui fluid large teal button">
   </div>
   <div class="ui error message">
    <ul class="list">
     {foreach $errors as $error}
     <li>{$error}</li>
     {/foreach}
    </ul>
   </div>
 </form>
</br>
{/if}
    {foreach $comments as $c}
      <div class="ui comments">
  <div class="comment">
    <a class="avatar">
        {if $c.creator == null}<img class="ui small rounded image" src="{base_url('media/avatars/none.png')}">{else}
        <img class="ui small rounded image" src="{if $c.user_avatar eq ''}{base_url('media/avatars/none.png')}{else}{base_url('media/avatars/')}{$c.user_avatar}{/if}">{/if}
    </a>
    <div class="content">
      <a class="author" href="{site_url('profile/view/')}{$c.creator}">{if $c.creator == null}Anonyme{else}{$c.user_login}{/if}</a>
      <div class="metadata">
        <div class="date">Le {$c.date|date_format}</div>
      </div>
      <div class="text">
        {$c.text}
      </div>
    </div>
  </div>
</div>
    {/foreach}
  </div>
{/block}
