<?php $running_year = $this->db->get_where('settings' , array(
'type' => 'running_year'
))->row()->description; ?>

<div class="row bg-title">
        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
            <h4 class="page-title"><?php echo get_phrase('Voting');?></h4>
        </div>
        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
            <ol class="breadcrumb">
                <li><a href="<?php echo base_url(); ?>index.php?admin/admin_dashboard"><?php echo get_phrase('Dashboard');?></a></li>
                <li><a class="active"><?php echo get_phrase('Voting');?></a></li>
            </ol>
        </div>
    </div>
 <?php
 $this->db->select('student.name,count(voting_process.candidate_student_id) as vote_count,voting_process.candidate_student_id,voting_process.position_id');
 $this->db->from('voting_process');
 $this->db->join('student','student.student_id = voting_process.candidate_student_id');
 $this->db->group_by('voting_process.candidate_student_id');
 $q= $this->db->get();
 $arrResult = $q->result_array();
 ?>


    <div class="row">
        <div class="col-sm-12">
            <ul class="nav nav-tabs bordered">
                <li class="active">
                    <a href="#list" data-toggle="tab">
                        <?php echo get_phrase('Register Candidate');?>
                    </a>
                </li>
                <li><a href="#add" data-toggle="tab">
                        <?php echo get_phrase('List');?>
                    </a>
                </li>
                <li><a href="#win" data-toggle="tab">
                        <?php echo get_phrase('Winner of the year');?>
                    </a>
                </li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane box active" id="list">
                    <div class="white-box">
                        <div class="box-content">
                            <?php echo form_open(base_url() . 'index.php?admin/candidate_create/' , array('class' => 'form-horizontal form-groups-bordered validate ajax-submit', 'enctype' => 'multipart/form-data'));?>
                            <div class="form-group">
                                <label class="control-label"><?php echo get_phrase('Name');?></label>
                                <div class="col-sm-5">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="ti-user"></i></div>
                                        <select name="user" class="form-control" onchange="getpicture(this.value)">
                                            <?php
                                            $getenroll = $this->db->get_where('enroll' , array('year'=>$running_year))->result_array();
                                            foreach($getenroll as $index => $item){
                                                $getstudentname = $this->db->get_where('student',array('student_id' => $item['student_id']))->row()->name;
                                                $getstudentid = $this->db->get_where('student',array('student_id' => $item['student_id']))->row()->student_id;
                                                echo '<option value="'.$getstudentid.'">'.$getstudentname.'</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="image-container">
                                <div class="col-md-4 col-sm-4 text-center"><a href="#"><img src="http://localhost/school_management/uploads/user.jpg" alt="user" class="img-circle img-responsive"></a></div>
                            </div>
                            <div class="form-group">
                                <label class="control-label"><?php echo get_phrase('Position');?></label>
                                <div class="col-sm-5">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="ti-user"></i></div>
                                        <select name="position" class="form-control">
                                            <?php
                                            $name = $this->db->get('voting_position')->result_array();
                                            foreach ($name as $index => $item) {
                                                echo '<option value="'.$item['position_id'].'">'.$item['name'].'</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-info"><?php echo get_phrase('Add');?></button>
                                    <span id="preloader-form"></span>
                                </div>
                            </div>
                            <?php echo form_close();?>
                        </div>
                    </div>
                </div>
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
                            <div class="col-md-4 col-sm-4 text-center"><a href="<?php echo base_url();?>index.php?admin/student_portal/<?php echo $row['student_id'];?>"><img src="<?php echo $this->crud_model->get_image_url('student',$row['student_id']);?>" alt="user" class="img-circle img-responsive"></a></div>
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
                            <div class="col-md-4 col-sm-4 text-center"><a href="<?php echo base_url();?>index.php?admin/student_portal/<?php echo $row['student_id'];?>"><img src="<?php echo $this->crud_model->get_image_url('student',$row['student_id']);?>" alt="user" class="img-circle img-responsive"></a></div>
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
                            }
                            $xd++;
                        }
                        ?>
                    </div>
                </div>
                <div class="tab-pane box" id="win">
                    <div class="box-content">
                        <ul class="nav nav-tabs bordered">
                            <?php
                            $positions = $this->db->get('voting_position')->result_array();
                            $count = 0;
                            foreach ($positions as $index => $item) {
                                if($count == 0){
                                    echo '<li class="active">';
                                    echo '<a href="#tab2_'.$index.'" data-toggle="tab">';
                                    echo get_phrase($item['name']);
                                    echo '</a>';
                                    echo '</li>';

                                }else{
                                    echo '<li>';
                                    echo '<a href="#tab2_'.$index.'" data-toggle="tab">';
                                    echo get_phrase($item['name']);
                                    echo '</a>';
                                    echo '</li>';
                                }
                                $count++;
                            }
                            ?>
                        </ul>

                        <div class="tab-content">
                            <?php
                            $xd = 0;
                            $count = 0;
                            $stud_id = 0;
                            foreach ($positions_data as $index => $x){
                                $getstudent = $this->db->get_where('candidate_info',array('position' => $x['position_id']))->result_array();
                                //first tab of the president active
                                if($xd == 0){
                                    echo '<div class="tab-pane box active" id="tab2_' . $x['position_id'] . '">';
                                    echo '<div class="box-content">';
                                    foreach ($getstudent as $index => $item){
                                        if($x['position_id'] == $item['position']){
                                            //$arrResult is came from very top code
                                            foreach ($arrResult as $index => $itemx) {
                                                if($itemx['position_id'] == $item['position']){
                                                        if($itemx['vote_count'] >= $count){
                                                            $count = $itemx['vote_count'];
                                                            $stud_id = $itemx['candidate_student_id'];
                                                        }
                                                }
                                            }
                                            ?>
                                            <div class="form-group">
                                                <?php $students = $this->db->get_where('student',array('student_id' => $stud_id))->result_array();
                                                foreach($students as $row):?>
                                                    <div class="col-md-4 col-sm-4">
                                                        <div class="col-md-4 col-sm-4 text-center"><a href="<?php echo base_url();?>index.php?admin/student_portal/<?php echo $row['student_id'];?>"><img src="<?php echo $this->crud_model->get_image_url('student',$row['student_id']);?>" alt="user" class="img-circle img-responsive"></a></div>
                                                        <div class="col-md-8 col-sm-8">
                                                            <h3 class="box-title m-b-0"><a href="<?php echo base_url();?>index.php?admin/student_portal/<?php echo $row['student_id'];?>"><?php echo $this->db->get_where('student' , array('student_id' => $row['student_id']))->row()->name;?></a></h3>
                                                            <small><?php echo $row['roll'];?></small>
                                                        </div>
                                                    </div>
                                                <?php endforeach;?>
                                            </div>
                                            <?php
                                        }
                                    break;
                                    }
                                    echo '</div>';
                                    echo '</div>';
                                }else{
                                    //the rest tab
                                    echo '<div class="tab-pane box" id="tab2_' . $x['position_id'] . '">';
                                    echo '<div class="box-content">';
                                    foreach ($getstudent as $index => $item) {
                                        if($x['position_id'] == $item['position']){
                                            //$arrResult is came from very top code
                                            foreach ($arrResult as $index => $itemx) {
                                                if($itemx['position_id'] == $item['position']){
                                                    if($itemx['vote_count'] >= $count){
                                                        $count = $itemx['vote_count'];
                                                        $stud_id = $itemx['candidate_student_id'];
                                                    }
                                                }
                                            }
                                            ?>
                                            <div class="form-group">
                                                <?php $students = $this->db->get_where('student',array('student_id' => $stud_id))->result_array();
                                                foreach($students as $row):?>
                                                    <div class="col-md-4 col-sm-4">
                                                        <div class="col-md-4 col-sm-4 text-center"><a href="<?php echo base_url();?>index.php?admin/student_portal/<?php echo $row['student_id'];?>"><img src="<?php echo $this->crud_model->get_image_url('student',$row['student_id']);?>" alt="user" class="img-circle img-responsive"></a></div>
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
                                    break;
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
            </div>
            <script>
                function getpicture(i){
                    $.ajax({
                        url: '<?php echo base_url(); ?>index.php?admin/get_student_image/' + i,
                        success:function (response)
                        {
                            jQuery('#image-container').html(response);
                        }
                    });
                }
            </script>