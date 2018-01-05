<div class="ui inverted vertical footer segment">
  <div class="ui center aligned container">
    {* <img src="assets/images/logo.png" class="ui centered mini image"> *}
    <div class="ui horizontal inverted small divided link list">
      {* <a class="item" href="#">Site Map</a> *}
      <a class="item" href="#">Contact Us</a>
      <a class="item" href="#">About us</a>
      {* <a class="item" href="#">Terms and Conditions</a> *}
      {* <a class="item" href="#">Privacy Policy</a> *}
    </div>
  </div>
  <form method="post" accept-charset="utf-8">
   <select name="language" class="ui dropdown" id="select_language" onchange="this.form.submit()">
    <option value="english" {if $language eq 'english'}selected{/if}>English</option>
    <option value="french" {if $language eq 'french'}selected{/if}>Français</option>
   </select>
   <input type="hidden" name="disable_form_validation">
  </form>
  <script>
  $('#select_language')
  .dropdown()
;
</script>
</div>
