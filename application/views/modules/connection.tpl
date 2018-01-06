{extends file="../layout.tpl"}

{block name="body"}
<div class="ui center aligned segment">
  <h2 class="ui header">Connexion</h2>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form {if not empty($errors)}error{/if}" method="post" accept-charset="utf-8">
      <div class="ui stacked segment">
        <div class="field {if not empty(form_error('email'))}error{/if}">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="email" placeholder="E-mail address" value="{'email'|set_value}">
          </div>
        </div>
        <div class="field {if not empty(form_error('password'))}error{/if}">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password" value="{'password'|set_value}">
          </div>
        </div>
        <input type="submit" name="connection" value="Login" class="ui fluid large teal button">
        <!-- <div name="connection" class="ui fluid large teal submit button">Login</div> -->
      </div>
      <div class="ui error message">
       <ul class="list">
        {foreach $errors as $error}
        <li>{$error}</li>
        {/foreach}
       </ul>
      </div>
      <input type="hidden" name="redirect" value="{'redirect'|set_value}">
    </form>

    <div class="ui message">
      New to us? <a href="{site_url('profile/edit/new')}">Sign Up</a>
    </div>
  </div>
</div>
{/block}

{block name="javascript"}
<!-- <script src="{base_url('assets/js/connection.js')}" charset="utf-8"></script>
{if isset($error_message)}
<script>
$('.ui.form').form("add errors", [ '{$error_message}' ]);
</script>
{/if} -->
{/block}
