<?php $__env->startSection('content'); ?>
    <div class="title m-b-md">
        <?php if(env('APP_LOGO')): ?>
            <div><img src="<?php echo e(env('APP_LOGO')); ?>" /></div>
        <?php endif; ?>
        <?php echo e(config('app.name')); ?>

    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.welcome', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laravelpractice\itymeBackend-master_final\resources\views/welcome.blade.php ENDPATH**/ ?>