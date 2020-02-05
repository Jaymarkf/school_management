<div class="col-md-4 col-sm-4 text-center">
    <a href="http://localhost/school_management/index.php?admin/student_portal/<?php echo $student_id; ?>">
        <?php if(file_exists('uploads/student_image/tmp/'.$student_id.'.jpg')){
          echo '<img src="'. $this->crud_model->get_image_url('student',$student_id).'" class="img-responsive"/>';
        }else{
          echo '<img src="uploads/user.jpg" class="img-responsive"/>';
        }
        ?>
    </a>
</div>