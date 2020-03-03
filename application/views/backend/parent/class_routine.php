 <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title"><?php echo get_phrase('Class-Routine'); ?></h4> </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>index.php?parents/parents_dashboard"><?php echo get_phrase('Dashboard'); ?></a></li>
            <li class="active"><?php echo get_phrase('Class-Routine'); ?></li>
        </ol>
    </div>
</div>

<?php $running_year = $this->db->get_where('settings' , array('type' => 'running_year'))->row()->description; ?>
<?php
    $irregular = 0;

    $child_of_parent = $this->db->get_where('enroll' , array(
        'student_id' => $student_id , 'year' => $running_year
    ))->result_array();
    $student_status = $child_of_parent[0];
    if($student_status['section_id'] == 0){
        $irregular = 1;

    }else{
        $irregular = 0;

    }
        foreach ($child_of_parent as $row) :
            $class_id = $this->db->get_where('enroll' , array('student_id' => $row['student_id'] , 'year' => $running_year))->row()->class_id;
            $section_id = $this->db->get_where('enroll' , array('student_id' => $row['student_id'] , 'year' => $running_year))->row()->section_id;
            $sub =  $this->db->get_where('enroll',array('student_id' => $student_status['student_id']))->row()->selected_subject;

?>
<div class="label label-info pull-right" style="font-size: 14px; font-weight: 100;">
    <i class="entypo-user"></i> <?php echo $this->db->get_where('student' , array('student_id' => $row['student_id']))->row()->name;?>
</div>
<br><br>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info" data-collapsed="0">
            <div class="panel-heading" >
                <div class="panel-title" style="font-size: 16px; color: white; text-align: center;">
                   <?php echo get_phrase('Class'); ?> - <?php echo $this->db->get_where('class' , array('class_id' => $class_id))->row()->name;?> : 
                   <?php echo get_phrase('Section'); ?> - <?php echo $this->db->get_where('section' , array('section_id' => $row['section_id']))->row()->name;?>
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


                                if($irregular == 0 ){
                                    $this->db->order_by("time_start", "asc");
                                    $this->db->where('day' , $day);
                                    $this->db->where('class_id' , $class_id);
                                    $this->db->where('section_id' , $section_id);


                                }else{


                                    $subject = explode(',',$sub);
                                    $subject_array = array();
                                    foreach ($subject as $i) {
                                        $subarr = $this->db->get_where('class_routine',array('subject_id'=>$i,'day'=>$day));
                                        if($subarr->num_rows() > 0 ){
                                            $subject_array[] = $i;
                                        }
                                    }

                                    if(count($subject_array) > 1 ){
                                        //more than one query
                                        $x = array();
                                        foreach ($subject_array as $i) {
                                            $x[] = ' subject_id = '.$i;
                                        }
                                        $res = implode(" or ",$x);
                                        $this->db->where('day',$day);
                                        $this->db->where($res);

                                    }else{
                                        //1 query only
                                        $qry = array('subject_id'=>$subject_array[0],'day'=>$day);
                                        $this->db->where($qry);
                                    }


                                }
                                $this->db->where('year' , $running_year);

                                $routines   =   $this->db->get('class_routine')->result_array();
                                foreach($routines as $row2):
                                    ?>
                                <div class="btn-group">
                                    <button class="btn btn-info">
                                        <?php echo $this->crud_model->get_subject_name_by_id($row2['subject_id']);?>
                                        <?php
                                        if ($row2['time_start_min'] == 0 && $row2['time_end_min'] == 0)
                                            echo '('.$row2['time_start'].'-'.$row2['time_end'].' | Room-['.$row2['room_id'].'])';
                                        if ($row2['time_start_min'] != 0 || $row2['time_end_min'] != 0)
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
<?php endforeach;?>
