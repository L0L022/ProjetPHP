<a class="{if $page eq 'home'}active{/if} item" href="?page=home">
  Accueil
</a>
<a class="{if $page eq 'recipe'}active{/if} item" href="?page=recipe">
  Recettes
</a>
<a class="{if $page eq 'profile'}active{/if} item" href="?page=profile">
  Espace perso
</a>
<div class="right menu">
  <div class="ui category search item">
    <div class="ui transparent icon input">
      <input class="prompt" placeholder="Rechercher une recette..." type="text">
      <i class="search link icon"></i>
    </div>
    <div class="results"></div>
  </div>
  <a class="ui {if $page eq 'connection'}active{/if} item" href="?page=connection">
    Connexion
  </a>
</div>
