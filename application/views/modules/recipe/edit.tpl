{extends file="../../layout.tpl"}

{block name="css"}
<link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}

<div class="ui center aligned segment">
  <div class="ui grid">
    <div class="row">
      <div class="four wide column">
        <form method="get" action="{site_url('profile/view/')}{'creator'|set_value}">
          <button class="ui small basic labeled icon button">
            <i class="left chevron icon"></i>
            Retour vers profil
          </button>
        </form>
      </div>
      <div class="eight wide column">
        <h2 class="ui header">{if $new === true}Nouvelle recette{else}Modifier une recette{/if}</h2>
      </div>
      <div class="four wide column">
      </div>
    </div>
  </div>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
      <form class="ui large form {if not empty($success)}success{/if}{if not empty($errors)}error{/if}" method="post" accept-charset="utf-8">
      <div class="ui stacked segment">
       <div class="field {if not empty(form_error('title'))}error{/if}">
          <label for="title">Titre recette</label>
           <input required type="text" name="title" placeholder="Titre" value="{'title'|set_value}" autofocus>
       </div>
       <div class="field {if not empty(form_error('result_amount'))}error{/if}">
         <label>Catégorie</label>
         <select required multiple name="categories[]" class="ui search dropdown">
           <option value="">Select category</option>
           {foreach $categories as $c}
           <option value="{$c.id}" {set_select('categories', $c.id)}>{$c.label}</option>
           {/foreach}
         </select>
       </div>
        <div class="field {if not empty(form_error('description'))}error{/if}">
          <label for="title">Description</label>
          <textarea rows="1" cols="50" name="description" placeholder="Description">{'description'|set_value}</textarea>
        </div>
        {* <div class="field {if not empty(form_error('ingredients'))}error{/if}">
          <label for="title">Ingredients</label>
          <div class="ui grid">
            <div class="row">
               <div class="thirteen wide column">
          <select required class="ui fluid search dropdown">
            <option value="">Ingredient</option>
            {foreach $ingredients as $i}
              <option value="{$i.id}">{$i.label}</option>
            {/foreach}
          </select>
        </div>
        <div class="three wide column">
          <button class="positive fluid ui button">Ajouter</button>
        </div>
        </div>
      </div>
    </div> *}
        <div class="field {if not empty(form_error('explanation'))}error{/if}">
          <label for="title">Explication</label>
          <textarea required rows="5" cols="50" name="explanation" placeholder="Explication">{'explanation'|set_value}</textarea>
        </div>
        <div class="field {if not empty(form_error('difficulty'))}error{/if}">
          <label>Difficulté</label>
          <select required  name="difficulty" class="ui search dropdown">
                  <option value="">Selectionne le niveau de difficulté</option>
                  <option value="easy" {set_select('difficulty', 'easy')}> Facile </option>
                  <option value="medium" {set_select('difficulty', 'medium')}> Moyen </option>
                  <option value="hard" {set_select('difficulty', 'hard')}> Dur </option>
          </select>
        </div>
        <div class="field {if not empty(form_error('cost'))}error{/if}">
          <label>Coût de la recette en moyenne</label>
          <SELECT required name="cost" class="ui search dropdown">
            <option value="">Selectionne le niveau de difficulté</option>
            <option value="low" {set_select('cost', 'low')}> Faible </option>
            <option value="average" {set_select('cost', 'average')}> Moyen </option>
            <option value="high" {set_select('cost', 'high')}> Éleve </option>
          </SELECT>
        </div>
        <div class="field {if not empty(form_error('time_preparation'))}error{/if}">
          <label for="time_preparation">Temps de preparation (hh/mm)</label>
          <div class="ui small input focus">
            <input required placeholder="temps" type="time" name="time_preparation" value="{set_value('time_preparation','00:00')|date_format:'%H:%M'}">
          </div>
        </div>
        <div class="field {if not empty(form_error('time_cooking'))}error{/if}">
          <label for="time_cooking">Temps de cuisson (hh/mm)</label>
          <div class="ui small input focus">
            <input placeholder="temps" type="time" name="time_cooking" value="{set_value('time_cooking','00:00')|date_format:'%H:%M'}">
          </div>
        </div>
        <div class="field {if not empty(form_error('time_rest'))}error{/if}">
          <label for="time_rest">Temps de repos (hh/mm)</label>
          <div class="ui small input focus">
            <input placeholder="temps" type="time" name="time_rest" value="{set_value('time_rest','00:00')|date_format:'%H:%M'}">
          </div>
        </div>
        <div class="field {if not empty(form_error('result_amount'))}error{/if}">
          <label for="title">
          <select name="result_type"class="ui dropdown">
            <option value="person" {set_select('result_type', 'person')}>Nombre de personnes </option>
            <option value="unit" {set_select('result_type', 'unit')}>Nombre d'unitées</option>
          </select>
         </label>
          <div class="ui left input">
            <input required type="number" name="result_amount"  min="1" value="{set_value('result_amount',1)}">
          </div>
        </div>
        <!-- <div class="ui fluid large teal submit button">Register</div> -->
        <input type="submit" name="register" value="{if $new === true}Ajouter{else}Modifier{/if}" class="ui fluid large teal button">
      </div>
      <div class="ui success message">
        {if $new === true} <p>Votre recette à bien été créer.</p>{else}<p>Votre recette à bien été modifier.</p>{/if}
      </div>
      <div class="ui error message">
       <ul class="list">
        {foreach $errors as $error}
        <li>{$error}</li>
        {/foreach}
       </ul>
      </div>
    </form>
  </div>
</div>

{/block}

{block name="javascript"}
  <script src="{base_url('assets/js/registration.js')}" charset="utf-8"></script>
  <script>
  $('select.dropdown')
  .dropdown()
;
</script>
{/block}
