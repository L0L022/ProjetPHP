{extends file="../layout.tpl"}
{block name="body"}

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form">
      <div class="ui stacked segment">
        <div class="field"> {*addresse email*}
          <div class="ui left icon input">
            <i class="at icon"></i>
            <input type="email" name="email" placeholder="E-mail address">
          </div>
        </div>
        <div class="field"> {*name*}
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="name" placeholder="Nom">
          </div>
        </div>
        <div class="field"> {*firstname*}
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="firstname" placeholder="Prenom">
          </div>
        </div>
        <div class="field"> {*date*}
          <div class="ui left icon input">
            <i class="calendar icon"></i>
            <input type="date" name="name">
          </div>
        </div>
        <div class="field"> {*Mot de passe*}
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Mot de passe">
          </div>
        </div>
        <div class="field"> {*Validation mot de passe*}
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Validation de mot de passe">
          </div>
        </div>
        <div class="ui fluid large teal submit button">Login</div>
      </div>
      <div class="ui error message"></div>
    </form>
  </div>
</div>

{/block}

{block name="javascript"}
  <script src="{base_url('assets/js/connection.js')}" charset="utf-8"></script>
{/block}
