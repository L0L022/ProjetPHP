{extends file="../../layout.tpl"}

{block name="css"}
<link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}
<div class="ui center aligned segment">
  <h2 class="ui header">{if $new === true}Nouvelle recette{else}Modifier une recette{/if}</h2>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form {if not empty($errors)}error{/if}" method="post" accept-charset="utf-8">
      <div class="ui stacked segment">
       <div class="field {if not empty(form_error('title'))}error{/if}">
          <label for="title">Titre recette</label>
           <input type="text" name="title" placeholder="Titre" value="{'title'|set_value}">
       </div>
        <div class="field {if not empty(form_error('description'))}error{/if}">
          <label for="title">Description</label>
          <textarea rows="1" cols="50" name="description" placeholder="Description">{'description'|set_value}</textarea>
        </div>
        <div class="field {if not empty(form_error('explanation'))}error{/if}">
          <label for="title">Explication</label>
          <textarea rows="5" cols="50" name="explanation" placeholder="Explication">{'explanation'|set_value}</textarea>
        </div>
        <div class="field {if not empty(form_error('time_preparation'))}error{/if}">
          <label for="time_preparation">Temps de preparation</label>
          <div class="ui small input focus">
            <input placeholder="temps" type="time" name="time_preparation" value="{'time_preparation'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('time_cooking'))}error{/if}">
          <label for="time_cooking">Temps de cuisson</label>
          <div class="ui small input focus">
            <input placeholder="temps" type="time" name="time_cooking" value="{'time_cooking'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('time_rest'))}error{/if}">
          <label for="time_rest">Temps de repos</label>
          <div class="ui small input focus">
            <input placeholder="temps" type="time" name="time_rest" value="{'time_rest'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('result_amount'))}error{/if}">
          <label for="title">Nombre de personnes</label>
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="number" name="result_amount" placeholder="Nombre de gens" min="1" value="{'result_amount'|set_value}">
          </div>
        </div>
        <!-- <div class="ui fluid large teal submit button">Register</div> -->
        <input type="submit" name="register" value="Register" class="ui fluid large teal button">
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


 <div class="ui center aligned segment">
   <h2 class="ui header">Creation de vos recettes</h2>
 </div>

 <div class="ui yellow top attached segment">
   <label for="title">Titre recette :</label>
   <div class="ui small input focus">
     <input placeholder="Titre" type="text" name="title">
   </div>
 </div>
 <div class="ui attached segment">
   <div class="field ">
       <label for="file1">Photo de votre recette:</label>
       <div class="ui fluid file input action">
           <input type="text">
           <input type="file" id="file1" name="avatar" autocomplete="off">
           <div class="ui button">
            <i class="file icon"></i>
               Select...
           </div>
       </div>
   </div>
 </div>
 <div class="ui attached segment">
   <label for="category">Categorie de votre recette :</label>
     <SELECT name="category">
             <OPTION> entrée
             <OPTION> repas
             <OPTION> dessert
     </SELECT>
 </div>
 <div class="ui attached segment">
   <label>Description :</label></br>
   <textarea rows="4" cols="50">
 Mettez une description de votre recette. Et ne faite pas genre qu'il y a rien à mettre sur votre recette de merde !!!
 Car autrement ça fait un petit vide tout moche quand quelqu'un voit votre recette ....
   </textarea>
 </div>
 <div class="ui attached segment">
   <label for="difficulty">Difficulté de votre recette :</label>
     <SELECT name="difficulty">
             <OPTION> 1
             <OPTION> 2
             <OPTION> 3
     </SELECT>
 </div>
 <div class="ui attached segment">
   <a href="#">L'ingredient n'existe pas ? Aider nous à mettre tous les ingredients.</a></br>
     <label>Tomate :</label>
   <div class="ui small input focus">
     <input placeholder="Quantite" type="text" name="quantity">
   </div>
   g
   <button class="negative ui labeled icon button">
     <i class="pause icon"></i>
     Enlever
   </button>
 </br>
   ajoute
   <label for="ingre">Ingredient :</label>
     <SELECT name="ingre">
             <OPTION> banane
             <OPTION> poire
             <OPTION> sel
             <OPTION> lait
     </SELECT>
     <button class="positive ui labeled icon button">
       <i class="pause icon"></i>
       Ajouter
     </button>
 </div>
 <div class="ui attached segment">
   <label>Etape 1 :</label>
 </br>
   <textarea rows="4" cols="50">
     bla bla bla ....
   </textarea>
   <button class="negative ui labeled icon button">
     <i class="pause icon"></i>
     Enlever
   </button>
 </br>
 </br>
 </br>
   ajoute
   <label>Etape 2 :</label>
   </br>
   <textarea rows="4" cols="50">
     bla bla bla ....
   </textarea>
     <button class="positive ui labeled icon button">
       <i class="pause icon"></i>
       Ajouter
     </button>
 </div>
 <div class="ui attached segment">
   <label for="time_preparation">Temps de preparation :</label>
   <div class="ui small input focus">
     <input placeholder="temps" type="text" name="time_preparation">
   </div>
 </div>
 <div class="ui attached segment">
   <label for="time_cooking">Temps de cuisson :</label>
   <div class="ui small input focus">
     <input placeholder="temps" type="text" name="time_cooking">
   </div>
 </div>
 <div class="ui attached segment">
   <label for="time_rest">Temps de repos :</label>
   <div class="ui small input focus">
     <input placeholder="temps" type="text" name="time_rest">
   </div>
 </div>
 <div class="ui attached segment">
   <label for="people">Nombre de personnes pour cette recette :</label>
   <div class="ui small input focus">
     <input placeholder="nombrede personnes" type="text" name="people">
   </div>
 </div>

 <div class="ui center aligned brown segment">
   <button class="positive ui button">Valider</button>
   <button class="negative ui button">Annuler</button>
 </div>


{/block}

{block name="javascript"}
  <script src="{base_url('assets/js/registration.js')}" charset="utf-8"></script>
{/block}
