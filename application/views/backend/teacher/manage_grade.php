<?php $running_year = $this->db->get_where('settings' , array('type' => 'running_year'))->row()->description; ?>
<div class="row bg-title">
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
        <h4 class="page-title"><?php echo get_phrase('Manage Grade'); ?></h4>
    </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url();?>index.php?teacher/admin_dashboard"><?php echo get_phrase('Dashboard'); ?></a></li><li class="active"><?php echo get_phrase('Attendance'); ?></li>
        </ol>
    </div>
</div>


<?php echo form_open(base_url() . 'index.php?teacher/grade_selector/'); ?>
<div class="row">
    <div class="col-md-3">
        <div class="form-group">
            <label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Semester');?></label>
            <select name="semester_id" class="form-control selectboxit">
                <option value=""><?php echo get_phrase('Select');?></option>
                <?php
                if($semester_id == 1){
                    echo "<option value='1' selected>1</option>";
                    echo "<option value='2'>2</option>";
                }else{
                    echo "<option value='1'>1</option>";
                    echo "<option value='2' selected>2</option>";
                }
                ?>
            </select>
        </div>
    </div>


    <div class="col-md-3">
        <div class="form-group">
            <label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Class');?></label>
            <select name="class_id" class="form-control selectboxit" onchange="select_section(this.value)">
                <option value=""><?php echo get_phrase('Select');?></option>
                <?php
                $classes = $this->db->get('class')->result_array();
                foreach ($classes as $row):
                    ?>
                    <option value="<?php echo $row['class_id']; ?>"
                        <?php if ($class_id == $row['class_id']) echo 'selected'; ?>><?php echo $row['name']; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>

    <div id="section_holder">
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Section');?></label>
                <select name="section_id" id="section_id" class="form-control selectboxit">
                    <?php $sections = $this->db->get_where('section', array('class_id' => $class_id))->result_array();
                    foreach ($sections as $row): ?>
                        <option value="<?php echo $row['section_id']; ?>"
                            <?php if ($section_id == $row['section_id']) echo 'selected'; ?>>
                            <?php echo $row['name']; ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
    </div>
    <div id="subject_holder">
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Subject');?></label>
                <select name="subject_id" id="subject_id" class="form-control selectboxit">
                    <?php $subjects = $this->db->get_where('subject', array('subject_id' => $subject_id))->result_array();
                    if(!empty($subjects)){
                    foreach ($subjects as $row): ?>
                        <option value="<?php echo $row['subject_id']; ?>"
                            <?php if ($subject_id == $row['subject_id']) echo 'selected'; ?>>
                            <?php echo $row['name']; ?>
                        </option>
                    <?php endforeach;


                        }

                    ?>
                </select>
            </div>
        </div>
    </div>
    <input type="hidden" name="year" value="<?php echo $running_year; ?>">

    <div class="col-md-3" style="margin-top: 20px;">
        <button type="submit" class="btn btn-info"><?php echo get_phrase('View');?></button>
    </div>

</div>
<?php echo form_close(); ?>

<hr />

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="white-box">
            <?php echo form_open(base_url() . 'index.php?teacher/grade_update/' . $class_id . '/' . $section_id . '/' . $subject_id . '/' . $semester_id); ?>
            <div id="attendance_update">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>No.</th>
                        <th style="text-align: center;"><?php echo get_phrase('Student');?></th>
                        <th style="text-align: center;"><?php echo get_phrase('Grade');?></th>
                        <th style="text-align: center;"><?php echo get_phrase('Specific Grade');?></th>
                        <th style="text-align: center;"><?php echo get_phrase('Comments (optional)');?></th>

                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $count = 1;
                   $q = '(class_id = '.$class_id.' and section_id = '.$section_id.' and year = "'.$running_year. '" and find_in_set("'.$subject_id.'",selected_subject))
                            or
                            (section_id = 0 and year = "'.$running_year. '"  and find_in_set("'.$subject_id.'",selected_subject))
                            ';
                    //die($q);
                    $this->db->where($q);
                    $temp_grade = $this->db->get('enroll')->result_array();
                    foreach ($temp_grade as $row):
                        ?>
                        <input type="hidden" name="student_id[]" value="<?php echo $row['student_id'];?>"/>
                        <input type="hidden" name="semester" value="<?php echo $semester_id; ?>"/>
                        <input type="hidden" name="class_id" value="<?php echo $class_id; ?>"/>
                        <input type="hidden" name="section_id" value="<?php echo $section_id; ?>"/>
                        <input type="hidden" name="subject_id" value="<?php echo $subject_id; ?>"/>

                        <tr>
                            <td><?php echo $count++; ?></td>
                            <td>
                                <?php echo $this->db->get_where('student', array('student_id' => $row['student_id']))->row()->name; ?>
                            </td>
                            <td>
                                <?php
                                $qd = '(semester = '.$semester_id.' and class_id = '.$class_id.' and section_id = '.$section_id.' and year = "'.$running_year. '" and subject_id = '.$subject_id.' and student_id = '.$row['student_id'].')
                            or
                            (semester = '.$semester_id.' and class_id = '.$class_id.' and section_id = 0 and year = "'.$running_year. '"  and subject_id = '.$subject_id.' and student_id = '.$row['student_id'].')
                            ';


                                $this->db->where($qd);
                                $x = $this->db->get('grades')->row()->student_grade;
                                //                                    $x = $this->db->get_where('grades',array('student_id' => $row['student_id'],'section_id' => $section_id,'class_id' => $class_id,'subject_id' => $subject_id))->row()->student_grade;

                                $this->db->where($qd);
                                $grade = $this->db->get('grades')->row()->specific_grade;
                                //
                                //                                    $grade = $this->db->get_where('grades',array('student_id' => $row['student_id'],'section_id' => $section_id,'class_id' => $class_id,'subject_id' => $subject_id))->row()->specific_grade;
                                ////
                                $this->db->where($qd);
                                $comments= $this->db->get('grades')->row()->comments;
                                //                                    $comments = $this->db->get_where('grades',array('student_id' => $row['student_id'],'section_id' => $section_id,'class_id' => $class_id,'subject_id' => $subject_id))->row()->comments;
                                ?>
                                <input type="number" name="specific_grade_id_<?php echo $row['student_id'];?>"
                                       placeholder="Enter grade form 1-100"  class="form-control input-grade" value="<?php echo $grade; ?>"/>
                            </td>
                            <td>
                                <select class="form-control selectboxit" name="grade_id_<?php echo $row['student_id']; ?>">
                                <option value="1" <?php if($x == 1){echo 'selected';} ?> >1.00</option>
                                <option value="2"<?php if($x == 2){echo 'selected';} ?> >1.25</option>
                                <option value="3"<?php if($x == 3){echo 'selected';} ?> >1.50</option>
                                <option value="4"<?php if($x == 4){echo 'selected';} ?> >1.75</option>
                                <option value="5"<?php if($x == 5){echo 'selected';} ?> >2.00</option>
                                <option value="6"<?php if($x == 6){echo 'selected';} ?> >2.25</option>
                                <option value="7"<?php if($x == 7){echo 'selected';} ?> >2.50</option>
                                <option value="8"<?php if($x == 8){echo 'selected';} ?> >2.75</option>
                                <option value="9"<?php if($x == 9){echo 'selected';} ?> >3.00</option>
                                <option value="10"<?php if($x == 10){echo 'selected';} ?> >5.00</option>
                                <option value="11"<?php if($x == 11 || $x == ''){echo 'selected';} ?> ></option>
                                </select>
                            </td>
                            <td>
                                <input type="text" <?php if($comments == "FAILED"){
                                    echo 'style="color:red"';
                                }else{
                                    echo 'style="color:black"';
                                }

                                ?> name="comments_id_<?php echo $row['student_id'];?>"
                                       placeholder="Enter your comments" class="form-control" value ="<?php echo $comments; ?>"  />
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

            <center>
                <button type="submit" class="btn btn-info" id="submit_button">
                    <i class="entypo-check"></i> <?php echo get_phrase('Update');?>
                </button>
            </center>
            <?php echo form_close(); ?>
        </div>
    </div>
</div>

<script type="text/javascript">
    function select_section(class_id) {
        $.ajax({
            url: '<?php echo base_url(); ?>index.php?teacher/get_section/' + class_id,
            success:function (response)
            {
                jQuery('#section_holder').html(response);
            }
        });
        $.ajax({
            url: '<?php echo base_url(); ?>index.php?teacher/get_subjects/' + class_id,
            success:function (response)
            {
                jQuery('#subject_holder').html(response);
            }
        });
    }
    $(document).ready(function(){
        $(".input-grade").keyup(function(){
            var value = this.value;
             if(100 >= value && 96 <= value) {
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(1);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('EXCELLENT');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(50,255,99)','color':'white'});
             }else if ( 95 >= value && 91 <= value ){
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(2);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('VERY GOOD');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(50,100,50)','color':'white'});
             }else if ( 90 >= value && 86 <= value ){
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(3);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('VERY GOOD');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(50,100,50)','color':'white'});
             }else if ( 85 >= value && 82 <= value ){
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(4);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('GOOD');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(50,100,99)','color':'white'});
             }else if ( 81 >= value && 75 <= value ){
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(5);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('GOOD');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(50,100,99)','color':'white'});
             }else if ( 74 >= value && 69 <= value ){
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(6);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('GOOD');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(50,100,99)','color':'white'});
             }else if ( 68 >= value && 63 <= value ){
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(7);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('FAIR');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(171,144,15)','color':'white'});
             }else if ( 62 >= value && 57 <= value ){
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(8);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('FAIR');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(171,144,15)','color':'white'});
             }else if ( 56 >= value && 50 <= value ){
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(9);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('FAIR');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(171,144,15)','color':'white'});
             }else if (50 > value) {
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(10);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('FAILED');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(255,50,50)','color':'white'});
             }else{
                 $(this).parents(":eq(1)").children(':nth-child(4)').children().val(11);
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().val('');
                 $(this).parents(":eq(1)").children(':nth-child(5)').children().css({'background-color':'rgb(255,255,255)','color':'white'});
             }

        });



    });
</script>