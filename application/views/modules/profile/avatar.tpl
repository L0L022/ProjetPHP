{extends file="../../layout.tpl"}

{block name="css"}
  <link rel="stylesheet" type="text/css" href="{base_url('assets/css/registration.css')}">
{/block}

{block name="body"}

<div class="ui center aligned segment">
  <div class="ui grid">
    <div class="row">
      <div class="four wide column">
        <form method="get" action="{site_url('profile/view/')}{$id}">
          <button class="ui small basic labeled icon button">
            <i class="left chevron icon"></i>
            Retour vers profil
          </button>
        </form>
      </div>
      <div class="eight wide column">
        <h2 class="ui header">Modification avatar</h2>
      </div>
      <div class="four wide column">
      </div>
    </div>
  </div>
</div>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <img class="ui centered medium rounded image" src="{base_url('media/avatars/')}{$avatar}" alt="">
    <form class="ui large form {if not empty($success)}success{/if}{if not empty($errors)}error{/if}" method="post" accept-charset="utf-8"  enctype="multipart/form-data">
      <div class="ui stacked segment">
        <div class="field">
            <div class="ui fluid file input action">
                <input type="text" readonly>
                <input type="file" id="file1" name="avatar" autocomplete="off">
                <div class="ui button">
                 <i class="file icon"></i>
                    Select...
                </div>
            </div>
        </div>
        <input type="submit" name="upload" value="Envoyer l'image" class="ui fluid large teal button">
        <br>
        {if $avatar ne ""}<input type="submit" name="remove" value="Supprimer" class="ui fluid large teal button">{/if}
      </div>
      <div class="ui success message">
        <p>Votre avatar à bien été modifier.</p>
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
