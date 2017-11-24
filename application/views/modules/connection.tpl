{extends file="../layout.tpl"}

{block name="body"}


<form class="ui center container form">
   <fieldset>
     <legend>Connexion</legend>
  <div class="field">
    <label>Login/Email :</label>
    <input name="login" placeholder="Votre login" type="text">
  </div>
  <div class="field">
    <label>Mot de passe :</label>
    <input name="PWD" placeholder="Votre mot de passe" type="text">
  </div>
  <button class="ui button" type="submit">Submit</button>
  </fieldset>
</form>

{/block}
