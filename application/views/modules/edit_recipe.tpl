{extends file="../layout.tpl"}
{block name="body"}

<div class="ui center aligned segment">
  <h2 class="ui header">Creation de vos recettes</h2>
</div>

<div class="ui yellow top attached segment">
  <label for="title">Titre recette :</label>
  <div class="ui small input focus">
    <input placeholder="Titre" type="text" name="title">
  </div>
</div>
<div class="ui grey attached segment">
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
<div class="ui grey attached segment">
  <label for="category">Categorie de votre recette :</label>
    <SELECT name="category">
            <OPTION> entrée
            <OPTION> repas
            <OPTION> dessert
    </SELECT>
</div>
<div class="ui grey attached segment">
  <label>Description :</label></br>
  <textarea rows="4" cols="50">
Mettez une description de votre recette. Et ne faite pas genre qu'il y a rien à mettre sur votre recette de merde !!!
Car autrement ça fait un petit vide tout moche quand quelqu'un voit votre recette ....
  </textarea>
</div>
<div class="ui grey attached segment">
  <label for="difficulty">Difficulté de votre recette :</label>
    <SELECT name="difficulty">
            <OPTION> 1
            <OPTION> 2
            <OPTION> 3
    </SELECT>
</div>
<div class="ui grey attached segment">
  <div class="ui divided items">
     <div class="item">
    <a href="#">L'ingredient n'existe pas ? Aider nous à mettre tous les ingredients.</a></br>
  </div>
   <div class="item">
  <label>Tomate :</label>
  <div class="ui small input focus">
    <input placeholder="Quantite" type="text" name="quantity">
  </div>
  g
  <button class="negative ui labeled icon button">
    <i class="pause icon"></i>
    Enlever
  </button>
</div>
 <div class="item">
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
</div>
</div>
<div class="ui grey attached segment">
    <div class="ui divided items">
      <div class="item">
  <label>Etape 1 :</label>
</br>
  <textarea rows="4" cols="50">
    bla bla bla ....
  </textarea>
  <button class="negative ui labeled icon button">
    <i class="pause icon"></i>
    Enlever
  </button>
</div>
<div class="item">
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
</div>
</div>
<div class="ui grey attached segment">
  <label for="time_preparation">Temps de preparation :</label>
  <div class="ui small input focus">
    <input placeholder="temps" type="text" name="time_preparation">
  </div>
</div>
<div class="ui grey attached segment">
  <label for="time_cooking">Temps de cuisson :</label>
  <div class="ui small input focus">
    <input placeholder="temps" type="text" name="time_cooking">
  </div>
</div>
<div class="ui grey attached segment">
  <label for="time_rest">Temps de repos :</label>
  <div class="ui small input focus">
    <input placeholder="temps" type="text" name="time_rest">
  </div>
</div>
<div class="ui grey attached segment">
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
