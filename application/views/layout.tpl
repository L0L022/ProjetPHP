<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="utf-8">
  <title>Projet PHP</title>

  <link rel="stylesheet" type="text/css" href="application/libraries/semantic/dist/semantic.min.css">
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

  <!-- JS Includes -->
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="application/libraries/semantic/dist/semantic.min.js"></script>
  {block name="javascript"}{/block}
</body>

</html>
