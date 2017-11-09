{extends file="../layout.tpl"}

{block name="body"}
<article class="">

  <p>Je suis l'édito</p>

</article>

<article class="">

  <ul>
    {foreach $alea as $value}

      <li>{$value}</li>

    {/foreach}
  </ul>

</article>
{/block}
