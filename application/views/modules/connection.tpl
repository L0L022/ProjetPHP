{extends file="../layout.tpl"}

{block name="body"}

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form" method="post">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="email" placeholder="E-mail address">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password">
          </div>
        </div>
        <input type="submit" name="connection" value="Login" class="ui fluid large teal button">
        <!-- <div name="connection" class="ui fluid large teal submit button">Login</div> -->
      </div>
      <div class="ui error message"></div>
    </form>

    <div class="ui message">
      New to us? <a href="{site_url('registration')}">Sign Up</a>
    </div>
  </div>
</div>
{/block}

{block name="javascript"}
<script src="{base_url('assets/js/connection.js')}" charset="utf-8"></script>
{if isset($error_message)}
<script>
$('.ui.form').form("add errors", [ '{$error_message}' ]);
</script>
{/if}
{/block}
