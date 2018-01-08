{extends file="../../layout.tpl"}

{block name="css"}
<link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}

<div class="ui center aligned segment">
  <div class="ui grid">
    <div class="row">
      <div class="four wide column">
        <form method="get" action="{site_url('profile/view/')}{$creator}">
          <button class="ui small basic labeled icon button">
            <i class="left chevron icon"></i>
            Retour vers le profil
          </button>
        </form>
      </div>
      <div class="eight wide column">
        <h2 class="ui header">{if $new === true}Nouvelle recette{else}Modifier la recette {'title'|set_value}{/if}</h2>
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
       <div class="field {if not empty(form_error('categories'))}error{/if}">
         <label>Catégorie</label>
         <select multiple name="categories[]" class="ui search dropdown">
           <option value="">Selectionnez la ou les catégories</option>
           {foreach $categories as $c}
           <option value="{$c.id}" {set_select('categories', $c.id)}>{$c.label}</option>
           {/foreach}
         </select>
       </div>
        <div class="field {if not empty(form_error('description'))}error{/if}">
          <label for="title">Description</label>
          <textarea rows="1" cols="50" name="description" placeholder="Description">{'description'|set_value}</textarea>
        </div>
        <div class="field {if not empty(form_error('ingredients'))}error{/if}">
          <label>Ingrédients</label>
          <div id="ingredients"></div>
          <div id="new_ingredient" class="positive ui button">Ajouter</div>
        </div>
        <div class="field {if not empty(form_error('explanation'))}error{/if}">
          <label for="title">Explication</label>
          <textarea required rows="5" cols="50" name="explanation" placeholder="Explication">{'explanation'|set_value}</textarea>
        </div>
        <div class="field {if not empty(form_error('difficulty'))}error{/if}">
          <label>Difficulté</label>
          <select required  name="difficulty" class="ui search dropdown">
                  <option value="">Sélectionnez le niveau de difficulté</option>
                  <option value="easy" {set_select('difficulty', 'easy')}> Facile </option>
                  <option value="medium" {set_select('difficulty', 'medium')}> Moyenne </option>
                  <option value="hard" {set_select('difficulty', 'hard')}> Difficile </option>
          </select>
        </div>
        <div class="field {if not empty(form_error('cost'))}error{/if}">
          <label>Coût moyen de la recette</label>
          <SELECT required name="cost" class="ui search dropdown">
            <option value="">Sélectionnez le coût moyen de la recette</option>
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
{literal}
<script>
  var id = 0;
  //$('select.dropdown').dropdown();
function new_ingredient() {
    id = id + 1;
    $("#ingredients").append(
'  <div id="idg_'+id+'">'+
'    <div id="dropdown_'+id+'" class="ui selection search dropdown">'+
'      <input id="ingredient_'+id+'" name="ingredients['+id+'][ingredient]" type="hidden">'+
'      <i class="dropdown icon"></i>'+
'      <div class="default text">Ingrédient</div>'+
'      <div class="menu">'+
{/literal}
       {foreach $ingredients as $i}
{literal}
'         <div class="item" data-value="{/literal}{$i.id}{literal}">'+
'           <img class="ui mini avatar image" src="{/literal}{base_url('media/illustrations/')}{$i.illustration}{literal}">'+
'           {/literal}{$i.label}{literal}'+
'         </div>'+
{/literal}
       {/foreach}
{literal}
'      </div>'+
'    </div>'+
'    <div class="ui input">'+
'      <input id="quantity_'+id+'" type="number" name="ingredients['+id+'][quantity]"  min="1" value="1">'+
'    </div>'+
'    <select id="unit_'+id+'" name="ingredients['+id+'][unit]" class="ui search dropdown">'+
'      <option value="">Unité</option>'+
{/literal}
       {foreach $units as $u}
{literal}
'      <option value="{/literal}{$u.id}{literal}">{/literal}{$u.label}{literal}</option>'+
{/literal}
       {/foreach}
{literal}
'    </select>'+
'    <div id="idg_remove_'+id+'" class="negative ui button">Supprimer</div><br>'+
'  </div>');

   var my_id = id;
   $('#idg_remove_'+id).click(function(){
      $("#idg_"+my_id).remove();
   });

   $('#dropdown_'+id).dropdown();
   $('#unit_'+id).dropdown();
}
$("#new_ingredient").click(new_ingredient);
{/literal}
{foreach set_value('ingredients', array()) as $i}
new_ingredient();
$('#ingredient_'+id).val({$i.ingredient});
$('#quantity_'+id).val({$i.quantity});
$('#unit_'+id).val({$i.unit});
{/foreach}
$('.ui.dropdown').dropdown();
</script>
{/block}
