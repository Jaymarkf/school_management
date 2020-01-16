<?php $running_year = $this->db->get_where('settings' , array('type' => 'running_year'))->row()->description; ?>
<div class="row bg-title">
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
        <h4 class="page-title"><?php echo get_phrase('Manage Grade'); ?></h4>
    </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url();?>index.php?admin/admin_dashboard"><?php echo get_phrase('Dashboard'); ?></a></li><li class="active"><?php echo get_phrase('Attendance'); ?></li>
        </ol>
    </div>
</div>


<?php echo form_open(base_url() . 'index.php?admin/grade_selector/'); ?>
<div class="row">
    <div class="col-md-3">
        <div class="form-group">
            <label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Semester');?></label>
            <select name="class_id" class="form-control selectboxit">
                <option value=""><?php echo get_phrase('Select');?></option>
                <option value="1"<?php if($semester_id=1){echo"selected";}?>>1</option>
                <option value="2"<?php if($semester_id=1){echo"selected";}?>>2</option>
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
            <?php echo form_open(base_url() . 'index.php?admin/grade_update/' . $class_id . '/' . $section_id . '/' . $subject_id . '/' . $semester_id); ?>
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
                   $temp_grade = $this->db->get_where('enroll', array(
                        'class_id' => $class_id,
                        'section_id' => $section_id,
                        'year' => $running_year,
                    ))->result_array();
                    foreach ($temp_grade as $row):
                        ?>
                        <tr>
                            <td><?php echo $count++; ?></td>
                            <td>
                                <?php echo $this->db->get_where('student', array('student_id' => $row['student_id']))->row()->name; ?>
                            </td>
                            <td>
                                <select class="form-control selectboxit" name="status_<?php echo $row['student_id']; ?>">
                                   <option value="1">1.00</option>
                                   <option value="1.25">1.25</option>
                                   <option value="1.50">1.50</option>
                                   <option value="1.75">1.75</option>
                                   <option value="2.00">2.00</option>
                                   <option value="2.25">2.25</option>
                                   <option value="2.50">2.50</option>
                                   <option value="2.75">2.75</option>
                                   <option value="3.00">3.00</option>
                                   <option value="3.25">3.25</option>
                                   <option value="3.50">3.50</option>
                                   <option value="3.75">3.75</option>
                                   <option value="4.00">4.00</option>
                                   <option value="5.00">5.00</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="student_id_<?php echo $row['student_id'];?>"
                                       placeholder="Enter grade form 1-100" class="form-control"/>
                            </td>
                            <td>
                                <input type="text" name="student_id_<?php echo $row['student_id'];?>"
                                       placeholder="Enter your comments" class="form-control"/>
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