<?php 
get_header();
?>

<?php if (have_posts()) : while (have_posts()) : the_post(); ?>


	
<div class="post" id="post-<?php the_ID(); ?>">
	 <h2 class="storytitle"><a href="<?php the_permalink() ?>" rel="bookmark"><?php the_title(); ?></a></h2>
<h3><?php the_date() ?> <span class="commentlink"> <?php comments_popup_link(__('0'), __('1'), __('%')); ?></span></h3>
	<div class="meta">in <?php the_category(',') ?> @ <?php the_time() ?> <?php edit_post_link(__('edit')); ?>
<?php wp_link_pages(); ?>
</div>
	
	<div class="storycontent">
		<?php the_content(__('(more...)')); ?>
	</div>
	
	<div class="feedback">
            
	</div>

</div>

<?php comments_template(); // Get wp-comments.php template ?>

<?php endwhile; else: ?>
<p><?php _e('Sorry, no posts matched your criteria.'); ?></p>
<?php endif; ?>

<?php posts_nav_link(' &#8212; ', __('&laquo; Previous Page'), __('Next Page &raquo;')); ?>

<?php get_footer(); ?>
