<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="utf-8">
  <title>Projet PHP</title>

  <link rel="stylesheet" type="text/css" href="application/libraries/semantic/dist/semantic.min.css">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
  <script src="application/libraries/semantic/dist/semantic.min.js"></script>
</head>

<body>

  <header>
    {include file="layout/layout_header.inc.tpl"}
  </header>
  <nav class="ui secondary pointing menu">
    {include file="nav/nav.inc.tpl"}
  </nav>
  {block name="body"}{/block}
  <footer>
    {include file="layout/layout_footer.inc.tpl"}
  </footer>
</body>

</html>
