<?php $running_year = $this->db->get_where('settings' , array('type' => 'running_year'))->row()->description; ?>
<div class="row bg-title">
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
        <h4 class="page-title"><?php echo get_phrase('Manage Grade'); ?></h4>
    </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url();?>index.php?parents/parents_dashboard"><?php echo get_phrase('Dashboard'); ?></a></li><li class="active"><?php echo get_phrase('Manage Grade'); ?></li>
        </ol>
    </div>
</div>


<?php echo form_open(base_url() . 'index.php?parents/grade_selector/'); ?>
<input type="hidden" name="student_id" value="<?php echo $student_id; ?>"/>
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
            <div id="attendance_update">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="text-align: center;"><?php echo get_phrase('Grade');?></th>
                        <th style="text-align: center;"><?php echo get_phrase('Specific-Grade');?></th>
                        <th style="text-align: center;"><?php echo get_phrase('Comments');?></th>

                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $count = 1;
                    $q = '(class_id = '.$class_id.' and section_id = '.$section_id.' and year = "'.$running_year. '" and find_in_set("'.$subject_id.'",selected_subject) and student_id = '.$student_id.')
                            or
                            (class_id = '.$class_id.' and section_id = 0 and year = "'.$running_year. '"  and find_in_set("'.$subject_id.'",selected_subject) and student_id = '.$student_id.')';
                    $this->db->where($q);
                    $temp_grade = $this->db->get('enroll')->result_array();
                        ?>
                        <input type="hidden" name="student_id[]" value="<?php echo $student_id;?>"/>
                        <input type="hidden" name="semester" value="<?php echo $semester_id; ?>"/>
                        <input type="hidden" name="class_id" value="<?php echo $class_id; ?>"/>
                        <input type="hidden" name="section_id" value="<?php echo $section_id; ?>"/>
                        <input type="hidden" name="subject_id" value="<?php echo $subject_id; ?>"/>
                        <tr>
                            <td>
                                <select class="form-control selectboxit" name="grade_id_<?php echo $row['student_id']; ?>" disabled>
                                    <?php
                                    $x = $this->db->get_where('grades',array('student_id' => $student_id,'section_id' => $section_id,'class_id' => $class_id,'subject_id' => $subject_id,'semester'=>$semester_id))->row()->student_grade;
                                    $grade = $this->db->get_where('grades',array('student_id' => $student_id,'section_id' => $section_id,'class_id' => $class_id,'subject_id' => $subject_id,'semester'=>$semester_id))->row()->specific_grade;
                                    $comments = $this->db->get_where('grades',array('student_id' => $student_id,'section_id' => $section_id,'class_id' => $class_id,'subject_id' => $subject_id,'semester'=>$semester_id))->row()->comments;
                                    ?>
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
                                    <option value="11"<?php if($x == 11 || $x == ''){echo 'selected';} ?> ></option>o
                                </select>
                            </td>
                            <td>
                                <input type="text" name="specific_grade_id_<?php echo $student_id;?>"
                                       placeholder="Enter grade form 1-100" class="form-control" value="<?php echo $grade; ?>" disabled/>
                            </td>
                            <td>
                                <input type="text" name="comments_id_<?php echo $student_id;?>"
                                       placeholder="Enter your comments" class="form-control" value ="<?php echo $comments; ?>" disabled/>
                            </td>
                        </tr>
                    <?php
                    ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function select_section(class_id) {
        $.ajax({
            url: '<?php echo base_url(); ?>index.php?admin/get_section/' + class_id,
            success:function (response)
            {

                jQuery('#section_holder').html(response);
            }
        });

        $.ajax({
            url: '<?php echo base_url(); ?>index.php?admin/get_subjects/' + class_id,
            success:function (response)
            {
                jQuery('#subject_holder').html(response);
            }
        });

    }
</script>