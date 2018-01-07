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
         <div class="ui left icon input">
           <i class="user icon"></i>
           <input type="text" name="title" placeholder="Titre" value="{'title'|set_value}">
         </div>
       </div>
        <div class="field {if not empty(form_error('description'))}error{/if}">
          <div class="ui left icon input">
            <i class="at icon"></i>
            <input type="text" name="description" placeholder="Description" value="{'description'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('explanation'))}error{/if}">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="explanation" placeholder="Explication" value="{'explanation'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('result_amount'))}error{/if}">
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
{/block}

{block name="javascript"}
  <script src="{base_url('assets/js/registration.js')}" charset="utf-8"></script>
{/block}
