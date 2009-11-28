<!-- begin sidebar -->
<div id="menu">

<h2 id="home"><a href="<?php bloginfo('url'); ?>"><?php bloginfo('name'); ?></a></h2>
<ul>
<?php if ( !function_exists('dynamic_sidebar')
        || !dynamic_sidebar() ) : ?>

	<?php wp_list_pages(); ?>
	<?php get_links_list(); ?>
 <li id="categories"><h2><?php _e('Categories'); ?></h2>
	<ul>
	<?php wp_list_cats(); ?>
	</ul>
 </li>
 <li id="search">
   <label for="s"><h2><?php _e('Search'); ?></h2></label>	
   <form id="searchform" method="get" action="<?php echo $_SERVER['PHP_SELF']; ?>">
	<div>
		<input type="text" name="s" id="s" size="15" /><br />
		<input type="submit" id ="submit" value="<?php _e('Search'); ?>" />
	</div>
	</form>
 </li>

 <li id="archives"><h2><?php _e('Archives'); ?></h2>
 	<ul>
	 <?php wp_get_archives('type=monthly'); ?>
 	</ul>
 </li>


 <li id="meta"><h2><?php _e('Meta'); ?></h2>
 	<ul>
		<?php wp_register(); ?>
		<li><?php wp_loginout(); ?></li>
		<li><a href="feed:<?php bloginfo('rss2_url'); ?>" title="<?php _e('Syndicate this site using RSS'); ?>"><?php _e('RSS'); ?></a></li>
		<li><a href="feed:<?php bloginfo('comments_rss2_url'); ?>" title="<?php _e('The latest comments to all posts in RSS'); ?>"><?php _e('Comments RSS'); ?></a></li>
		<?php wp_meta(); ?>
	</ul>
 </li>


<?php endif; ?>

<li id="credits"><h2><?php _e('Credits'); ?></h2>
<ul>
<!--please leave intact for karma purposes. if it wasn't for all these great resources we wouldn't be able to bring you these themes for free :) -->
<li><a href="http://grabatheme.com">Grab A Theme</a></li>
<li><a href="http://www.drogue-designs.vze.com">Drogue Designs</a></li>
<li><a href="http://portfelia.com">Portfelia</a></li>
<li><a href="http://brushworx.artflower.de/">Brushworx</a></li>
<li><a href="http://www.pootato.org">Pootato</a></li>
<li><a href="http://www.theglassbead.vze.com">The Glass Bead</a></li>
</ul>
</li>
</ul>

</div>
<!-- end sidebar -->
