<?php

echo "hello world of deploy";

echo "<br/> troiseme test symlink pour image durant le deploy <br/>";
?>

<div><IMG SRC="/images/logo_noodle.jpg" ALT="logo noodle" TITLE="noodle"></div>
<div>	
	code pour creer un lien symbolique : <br/>
	ln -s /vhome/vhosts/dev.kantik.net/htdocs/olivier/test_deploy/asset/images /vhome/vhosts/dev.kantik.net/htdocs/olivier/test_deploy/current/images
</div>

<h1>Creer un nouvelle branche distante</h1>
<div> git remote add nombranch repertoireGithub </div>
<div> git push origin nomBranch </div>
