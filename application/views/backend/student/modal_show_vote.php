<?php
$student = $this->db->get_where('student',array('student_id'=>$param2))->result_array();
$running_year = $this->db->get_where('settings' , array('type' => 'running_year'))->row()->description;
$position_id = $param3;
?>

<div class='row'>
    <div class='container-fluid'>
        <div class='col-md-6'>
         <div class="col-md-4 col-sm-4 pull-right"><img src="<?php echo $this->crud_model->get_image_url('student',$param2);?>" alt="user" class="img-circle img-responsive"></div>
        </div>
        <div class='col-md-6'>
           <label style="margin-top:30px;"><?php echo $student[0]['name']; ?></label>
        </div>
    </div>
</div>
<div class='row'>
    <div class='container-fluid'>
        <div class='col-md-12 text-center'>
        <?php echo form_open(base_url() . 'index.php?student/vote_process/' , array('class' => 'form-horizontal form-groups-bordered validate','target'=>'_top'));?>
                <?php
                    $getclass = $this->db->get_where('enroll',array('year'=>$running_year,'student_id' => $student[0]['student_id']))->row()->class_id;
                    $getclass_label = $this->db->get_where('class',array('class_id'=>$getclass))->row()->name;
                ?>
                <div class='form-group'>
                       <label class='form-control'><?php echo get_phrase('Class'); ?></label>
                       <label class='form-control'><?php echo $getclass_label; ?></label>
                       <input type='hidden' name='candidate_id' value='<?php echo $student[0]["student_id"]; ?>'/>
                       <input type='hidden' name='voter_id' value='<?php echo $this->session->userdata("login_user_id"); ?>' />
                       <input type='hidden' name='candidate_position_id' value='<?php echo $position_id; ?>'/>
                       <input type='hidden' name='running_year' value='<?php echo $running_year; ?>'/>
                </div>
                <div class='form-group'>
                       <div class="col-sm-offset-3 col-sm-5">
                             <?php
                                   $getvoterinfo = $this->db->get_where('voting_process',array('student_voter_id'=>$this->session->userdata('login_user_id'),
                                    'position_id'=>$position_id));
                                    if($getvoterinfo->num_rows() > 0 ){
                                        $flag = "disabled";
                                        $message = "vote unavailable";
                                    }else{
                                        $flag = '';
                                        $message = "Vote";
                                    }
                             ?>
                            <button type="submit" class="btn btn-success"<?php echo $flag; ?>><?php echo get_phrase($message); ?></button>
                       </div>
                </div>
         </form>
        </div>
    </div>
</div>
