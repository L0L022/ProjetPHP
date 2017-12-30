{extends file="../layout.tpl"}
{block name="body"}
<p>Bienvenu {$user.name} {$user.firstname}</p>
{$user.login}
{$user.mail}
{$user.pass}
{$user.level}
{$user.avatar}

{* foreach {$user.recettes} truc affiche toutes les recettes de l'utilisateur *}

{/block}
