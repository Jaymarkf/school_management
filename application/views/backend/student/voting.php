<style>
    #imgvote{
        cursor:pointer;
    }
</style>
<div class="row bg-title">
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
        <h4 class="page-title"><?php echo get_phrase('Voting');?></h4>
    </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>index.php?student/admin_dashboard"><?php echo get_phrase('Dashboard');?></a></li>
            <li><a class="active"><?php echo get_phrase('Voting');?></a></li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="tab-pane box" id="add">
        <div class="box-content">
            <ul class="nav nav-tabs bordered">
                <?php
                $positions = $this->db->get('voting_position')->result_array();
                $count = 0;
                foreach ($positions as $index => $item) {
                    if($count == 0){
                        echo '<li class="active">';
                        echo '<a href="#tab_'.$index.'" data-toggle="tab">';
                        echo get_phrase($item['name']);
                        echo '</a>';
                        echo '</li>';

                    }else{
                        echo '<li>';
                        echo '<a href="#tab_'.$index.'" data-toggle="tab">';
                        echo get_phrase($item['name']);
                        echo '</a>';
                        echo '</li>';
                    }
                    $count++;
                }
                ?>
            </ul>
        </div>
        <?php
        $positions_data = $this->db->get('voting_position')->result_array();
        ?>
        <div class="tab-content">
            <?php
            $xd = 0;
            foreach ($positions_data as $index => $x) {
                $getstudent = $this->db->get_where('candidate_info',array('position' => $x['position_id'] ))->result_array();
                if($xd == 0){
                    echo '<div class="tab-pane box active" id="tab_' . $x['position_id'] . '">';
                    echo '<div class="box-content">';
                    foreach ($getstudent as $index => $item) {
                        if($x['position_id'] == $item['position']){
                            ?>
                            <div class="form-group">
                                <?php $students = $this->db->get_where('student',array('student_id' => $item['student_id']))->result_array();
                                foreach($students as $row):?>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="col-md-4 col-sm-4 text-center"><img onclick="showAjaxModal('<?php echo base_url();?>index.php?modal/popup/modal_show_vote/<?php echo $row['student_id'] ?>/<?php echo $item['position']; ?>')" src="<?php echo $this->crud_model->get_image_url('student',$row['student_id']);?>" alt="user" class="img-circle img-responsive"></div>
                                        <div class="col-md-8 col-sm-8">
                                            <h3 class="box-title m-b-0"><a href="<?php echo base_url();?>index.php?admin/student_portal/<?php echo $row['student_id'];?>"><?php echo $this->db->get_where('student' , array(
                                                        'student_id' => $row['student_id']))->row()->name;?></a></h3>
                                            <small><?php echo $row['roll'];?></small>
                                        </div>
                                    </div>
                                <?php endforeach;?>
                            </div>
                            <?php
                        }
                    }
                    echo '</div>';
                    echo '</div>';
                }else{
                    echo '<div class="tab-pane box" id="tab_' . $x['position_id'] . '">';
                    echo '<div class="box-content">';
                    foreach ($getstudent as $index => $item) {
                        if($x['position_id'] == $item['position']){
                            ?>
                            <div class="form-group">
                                <?php $students = $this->db->get_where('student',array('student_id' => $item['student_id']))->result_array();
                                foreach($students as $row):?>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="col-md-4 col-sm-4 text-center"><img id='imgvote'  onclick="showAjaxModal('<?php echo base_url();?>index.php?modal/popup/modal_show_vote/<?php echo $row['student_id'] ?>/<?php echo $item['position']; ?>')" src="<?php echo $this->crud_model->get_image_url('student',$row['student_id']);?>" alt="user" class="img-circle img-responsive"></div>
                                        <div class="col-md-8 col-sm-8">
                                            <h3 class="box-title m-b-0"><?php echo $this->db->get_where('student' , array('student_id' => $row['student_id']))->row()->name;?></h3>
                                            <small><?php echo $row['roll'];?></small>
                                        </div>
                                    </div>
                                <?php endforeach;?>
                            </div>
                            <?php
                        }
                    }
                    echo '</div>';
                    echo '</div>';
                }
                $xd++;
            }
            ?>

        </div>
    </div>
</div>
<script>
</script>