<?php $running_year = $this->db->get_where('settings' , array('type' => 'running_year'))->row()->description; ?>
<div class="row bg-title">
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
    <h4 class="page-title"><?php echo get_phrase('Attendance');?></h4> </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url();?>index.php?teacher/teacher_dashboard"><?php echo get_phrase('Class');?></a></li>
	        <li class="active"><?php echo get_phrase('Attendance');?></li>
	    </ol>                
    </div>
</div>


<?php echo form_open(base_url() . 'index.php?teacher/attendance_selector/');?>
<div class="row">
	<div class="col-md-3 col-md-offset-2">
		<div class="form-group">
		<label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Date');?></label>
			<input type="text" class="form-control mydatepicker" name="timestamp"
				value="<?php echo date("d-m-Y" , $timestamp);?>"/>
		</div>
	</div>

	<?php
		$query = $this->db->get_where('section' , array('class_id' => $class_id));
		if($query->num_rows() > 0):
			$sections = $query->result_array();
	?>

	<div class="col-md-3">
		<div class="form-group">
		<label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Section'); ?></label>
			<select class="form-control selectboxit" name="section_id">
				<?php foreach($sections as $row):?>
					<option value="<?php echo $row['section_id'];?>"
						<?php if($section_id == $row['section_id']) echo 'selected';?>><?php echo $row['name'];?></option>
				<?php endforeach;?>
			</select>
		</div>
	</div>
	<?php endif;?>
    <div class="col-md-3">
        <div class="form-group">
            <label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Subject'); ?></label>
            <select class="form-control selectboxit" name="subject_id">
                <?php
                $subj = $this->db->get_where('subject',array('subject_id' => $subject_id))->result_array();
                foreach ($subj as $index => $item) {
                    echo '<option value="'.$item['subject_id'].'">'.$item['name'].'</option>';
                }
                ?>
            </select>
        </div>
    </div>
	<input type="hidden" name="class_id" value="<?php echo $class_id;?>">
	<input type="hidden" name="year" value="<?php echo $running_year;?>">

	<div class="col-md-3" style="margin-top: 20px;">
		<button type="submit" class="btn btn-info"><?php echo get_phrase('View'); ?></button>
	</div>

<?php echo form_close();?>

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-12">
	<div class="white-box">
	<?php echo form_open(base_url() . 'index.php?teacher/attendance_update/'.$class_id.'/'.$section_id.'/'.$timestamp.'/'.$subject_id);?>
		<div id="attendance_update">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>No.</th>
						<th><?php echo get_phrase('Student'); ?></th>
						<th><?php echo get_phrase('Status'); ?></th>
					</tr>
				</thead>
				<tbody>
				<?php
					$count = 1;

                $qryd = '(class_id = '.$class_id.' and section_id = '.$section_id.' and year = "'.$running_year. '" and find_in_set("'.$subject_id.'",selected_subject))
                            or
                            (section_id = 0 and year = "'.$running_year. '"  and find_in_set("'.$subject_id.'",selected_subject))
                            ';
                $this->db->where($qryd);
                $students =  $this->db->get('enroll')->result_array();

//
//					if($section_id != ''){
//                        $qrs = ' (class_id = '.$class_id.' and section_id = '.$section_id.' and year = "'.$running_year. '" and timestamp = "'.$timestamp.'" and subject_id = "'.$subject_id.'")
//                            or
//                            ( section_id = 0 and year = "'.$running_year. '" and timestamp = "'.$timestamp.'" and subject_id = "'.$subject_id.'")
//                            ';
//                        $this->db->where($qrs);
//                        $attendance_of_students =  $this->db->get('attendance')->result_array();
//					}



					foreach($students as $row):
				?>
					<tr>
						<td><?php echo $count++;?></td>

						<td>
							<?php echo $this->db->get_where('student' , array('student_id' => $row['student_id']))->row()->name;?>
						</td>
						<td>
							<select class="form-control selectboxit" name="status_<?php
                                $x = $this->db->get_where('attendance',array('student_id' => $row['student_id'],'subject_id' => $subject_id,'year' => $running_year, 'timestamp' => $timestamp, 'class_id' => $class_id))->row()->attendance_id;
                                $stat = $this->db->get_where('attendance',array('student_id' => $row['student_id'],'subject_id' => $subject_id,'year' => $running_year, 'timestamp' => $timestamp, 'class_id' => $class_id))->row()->status;
                                echo $x;
                            ?>">
								<option value="0" <?php if($stat == 0) echo 'selected';?>><?php echo get_phrase('Select'); ?></option>
								<option value="1" <?php if($stat == 1) echo 'selected';?>><?php echo get_phrase('Present'); ?></option>
								<option value="2" <?php if($stat == 2) echo 'selected';?>><?php echo get_phrase('Absent'); ?></option>
								<option value="3" <?php if($stat == 3) echo 'selected';?>><?php echo get_phrase('Late');?></option>
							</select>	
						</td>
					</tr>
				<?php endforeach;?>
				</tbody>
			</table>
		</div>

		<center>
			<button type="submit" class="btn btn-success" id="submit_button">
				<i class="entypo-check"></i> <?php echo get_phrase('Update'); ?>
			</button>
		</center>
		<?php echo form_close();?>
	</div>
</div>
</div>
</div>