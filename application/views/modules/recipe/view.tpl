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
    <p>Créer par {$recipe.user_login}</p>
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
        <img class="ui fluid rounded image" src="{base_url('media/illustrations/')}{$recipe.illustration}">
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

<div class = "ui center aligned top attached segment">
  <h2 class="ui header">Espace commentaire</h2>
</div>
<div class = "ui attached segment">
 <form class="ui large form {if not empty($errors)}error{/if}" method="post" accept-charset="utf-8">
   <div class="ui stacked segment">
     <div class="field {if not empty(form_error('comment'))}error{/if}">
       <label for="title">Comment</label>
       <textarea rows="5" cols="50" name="comment" placeholder="Comment">{'comment'|set_value}</textarea>
     </div>
     <!-- <div class="ui fluid large teal submit button">Register</div> -->
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
  <div class="ui internally celled grid">
  <div class="row">
  </div>
    {foreach $comments as $c}
    <div class="row">
      <div class="ui comments">
  <div class="comment">
    <a class="avatar">
        <img class="ui small rounded image" src="{if $c.user_avatar eq ''}{base_url('media/avatars/Default.png')}{else}{base_url('media/avatars/')}{$c.user_avatar}{/if}">
    </a>
    <div class="content">
      <a class="author">{$c.user_login}</a>
      <div class="metadata">
        <div class="date">Le {$c.date|date_format}</div>
      </div>
      <div class="text">
        {$c.text}
      </div>
    </div>
  </div>
</div>

    </div>
    {/foreach}
  </div>
</div>
{/block}
