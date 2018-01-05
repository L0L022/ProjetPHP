{extends file="../layout.tpl"}

{block name="css"}
<link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}
<div class="ui center aligned segment">
  <h2 class="ui header">S'enregistrer</h2>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form {if not empty($errors)}error{/if}" method="post" accept-charset="utf-8" enctype="multipart/form-data">
      <div class="ui stacked segment">
       <div class="field {if not empty(form_error('login'))}error{/if}">
         <div class="ui left icon input">
           <i class="user icon"></i>
           <input type="text" name="login" placeholder="Identifiant" value="{'login'|set_value}">
         </div>
       </div>
        <div class="field {if not empty(form_error('mail'))}error{/if}">
          <div class="ui left icon input">
            <i class="at icon"></i>
            <input type="email" name="mail" placeholder="E-mail address" value="{'mail'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('name'))}error{/if}">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="name" placeholder="Nom" value="{'name'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('firstname'))}error{/if}">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="firstname" placeholder="Prénom" value="{'firstname'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('avatar'))}error{/if}">
            <label for="file1">Choose avatar:</label>
            <div class="ui fluid file input action">
                <input type="text" readonly value="{'avatar'|set_value}">
                <input type="file" id="file1" name="avatar" autocomplete="off" value="{'avatar'|set_value}">
                <div class="ui button">
                 <i class="file icon"></i>
                    Select...
                </div>
            </div>
        </div>
        <div class="field {if not empty(form_error('pass'))}error{/if}">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="pass" placeholder="Mot de passe" value="{'pass'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('pass2'))}error{/if}">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="pass2" placeholder="Validation de mot de passe" value="{'pass2'|set_value}">
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
{/block}

{block name="javascript"}
  <script src="{base_url('assets/js/registration.js')}" charset="utf-8"></script>
{/block}
