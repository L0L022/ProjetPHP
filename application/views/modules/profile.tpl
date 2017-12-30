{extends file="../layout.tpl"}
{block name="body"}
<p>Bienvenu {$user.name} {$user.firstname}</p>
<p>Voici votre login --> {$user.login}</p>
<p>Voici votre email --> {$user.mail}</p>
<p>Voici votre mot de passe --> {$user.pwd}</p>
<p>Voici votre avatar --> {$user.avatar}</p>

{foreach $user.recettes as $value}

<a href="{site_url('recipe/id/')}{$value.id}">{$value.name}</a></br>

{/foreach}

{/block}
