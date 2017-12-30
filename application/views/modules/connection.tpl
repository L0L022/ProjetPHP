{extends file="../layout.tpl"}

{block name="body"}

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form">
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
        <div class="ui fluid large teal submit button">Login</div>
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
{/block}
