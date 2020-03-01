<?php $running_year = $this->db->get_where('settings' , array('type' => 'running_year'))->row()->description; ?>
<div class="row bg-title">
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
        <h4 class="page-title"><?php echo get_phrase('Class-Routine');?></h4> 
    </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>index.php?student/student_dashboard"><?php echo get_phrase('Dashboard');?></a></li>
            <li class="active"><?php echo get_phrase('Class-Routine');?></li>
        </ol>
    </div>
</div>

<?php
   $section_id = '';
   $irreg = 0;
    $qry = $this->db->get_where('enroll' , array(
        'student_id' => $student_id,
        'class_id' => $class_id,
        'year' => $running_year
    ))->result_array();

    $student_enroll = $qry[0];
    if($student_enroll['section_id'] == 0 ){
        $irreg = 1;
////            echo $student_enroll['student_id'];
//        $get_subject = $this->db->get_where('student_irregular_selected_subject',array('student_id' => $student_enroll['student_id']))->row()->selected_subject_concat_id;
//        $subject_id = explode(',',$get_subject);
//        foreach ($subject_id as $item) {
//            $subject_ids = $item;
//        }
    }else{
        $irreg = 0;
        $section_id = $this->db->get_where('enroll' , array(
            'student_id' => $student_id,
            'class_id' => $class_id,
            'year' => $running_year
        ))->row()->section_id;
    }


?>

<hr />
<div class="row">    
    <div class="col-md-12">
        <div class="panel panel-info" data-collapsed="0">
          <div class="panel-heading" >
          <div class="panel-title" style="font-size: 16px; color: white; text-align: center;">
         <?php echo get_phrase('Class'); ?> - <?php echo $this->db->get_where('class' , array('class_id' => $class_id))->row()->name;?> : 
         <?php echo get_phrase('Section'); ?> - <?php echo $this->db->get_where('section' , array('section_id' => $section_id))->row()->name;?>
    </div>
</div>
<div class="panel-body">
<table cellpadding="0" cellspacing="0" border="0"  class="table table-bordered">
                    <tbody>
                        <?php 
                        for($d=1;$d<=7;$d++):
                        if($d==1)$day= get_phrase('Sunday');
                        else if($d==2) $day= get_phrase('Monday');
                        else if($d==3)$day = get_phrase('Tuesday');
                        else if($d==4)$day= get_phrase('Wednesday');
                        else if($d==5)$day= get_phrase('Thursday');
                        else if($d==6)$day= get_phrase('Friday');
                        else if($d==7)$day= get_phrase('Saturday');
                        ?>
                        <tr class="gradeA">
                            <td width="100"><?php echo strtoupper($day);?></td>
                            <td>
                                <?php
                                if($irreg == 0 ){
                                    $this->db->order_by("time_start", "asc");
                                    $this->db->where('day' , $day);
                                    $this->db->where('class_id' , $class_id);
                                    $this->db->where('section_id' , $section_id);
                                    $sub =  $this->db->get_where('enroll',array('student_id' => $this->session->userdata('student_id')))->row()->selected_subject;
                                        $subject = explode(',',$sub);
                               

                                }else{
                                    $this->db->order_by("time_start", "asc");
                                    $this->db->where('day' , $day);
                                }
                                $this->db->where('year' , $running_year);
                                $routines   =   $this->db->get('class_routine')->result_array();
                                foreach($routines as $row2):
                                ?>
                                <div class="btn-group">

                                    <button class="btn btn-info">
                <?php echo $this->crud_model->get_subject_name_by_id($row2['subject_id']);?>
                <?php
                    if($row2['time_start'] > 12  ){
                        $row2['time_start'] = $row2['time_start'] - 12;
                        $mode = " PM";
                    }else{
                        $mode = " AM";
                    }
                    if($row2['time_end'] > 12  ){
                        $row2['time_end'] = $row2['time_end'] - 12;
                        $mode1 = " PM";
                    }else{
                        $mode1 = " AM";
                    }
                echo '( '.$row2['time_start'].':'.$row2['time_start_min'].$mode.' to '.$row2['time_end'].':'.$row2['time_end_min'].$mode1.' | Room-['.$row2['room_id'].'])'; ?>
                                    </button>
                                </div>
                                <?php endforeach;?>
                            </td>
                        </tr>
                        <?php endfor;?>
                    </tbody>
                </table>  
            </div>
        </div>
    </div>
</div>