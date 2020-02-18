<style>
    .field-icon {
        float: right;
        margin-left: -25px;
        margin-top: -25px;
        position: relative;
        z-index: 2;
    }

    .container{
        padding-top:50px;
        margin: auto;
    }

</style>

<div class="row bg-title">
<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
    <h4 class="page-title"><?php echo get_phrase('Add-Student'); ?></h4> </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url();?>index.php?admin/admin_dashboard"><?php echo get_phrase('Dashboard'); ?></a></li>
            <li class="active"><?php echo get_phrase('Add-Student'); ?></li>
        </ol>
    </div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-info" data-collapsed="0">
        	<div class="panel-heading">
            	<div class="panel-title" >
					<font color="white"><?php echo get_phrase('Student-Form'); ?></font>
            	</div>
            </div>

			<div class="panel-body">
                <?php echo form_open(base_url() . 'index.php?admin/student/create/' , array('class' => 'form-horizontal form-groups-bordered validate', 'enctype' => 'multipart/form-data'));?>
					<div class="form-group">
						<label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Name'); ?></label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="name" required="" value="" autofocus>
						</div>
					</div>

					<div class="form-group">
						<label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Username'); ?></label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="username" required value="" autofocus>
						</div>
					</div>

					<div class="form-group">
						<label for="field-2" required class="col-sm-3 control-label"><?php echo get_phrase('Parent'); ?></label>
                        
						<div class="col-sm-5">
							<select name="parent_id" class="form-control select2">
                              <option value=""><?php echo get_phrase('Select'); ?></option>
                              <?php 
								$parents = $this->db->get('parent')->result_array();
								foreach($parents as $row): ?>
                            		<option value="<?php echo $row['parent_id'];?>">
									<?php echo $row['name'];?>
                                    </option>
                                <?php
								endforeach;
							  ?>
                          </select>
						</div> 
					</div>

                    <div class="form-group">
                        <label for="field-2" class="col-sm-3 control-label"><?php echo get_phrase('Status'); ?></label>
                        <div class="col-sm-5">
                            <select name="status_id" class="form-control status_id" id="status_id">
                                <option value=""><?php echo get_phrase('Select-Status'); ?></option>
                                <option value="1"><?php echo get_phrase('Regular'); ?></option>
                                <option value="2"><?php echo get_phrase('Irregular'); ?></option>
                            </select>
                        </div>
                    </div>

					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label"><?php echo get_phrase('Class'); ?></label>
						<div class="col-sm-5">
							<select name="class_id" class="form-control" required="" onchange="return get_class_sections(this.value)">
                              <option value=""><?php echo get_phrase('Select'); ?></option>
                              <?php $classes = $this->db->get('class')->result_array();
								foreach($classes as $row): ?>
                            		<option value="<?php echo $row['class_id'];?>">
									<?php echo $row['name'];?>
                                    </option>
                                <?php
								endforeach;
							  ?>
                          </select>
						</div>
					</div>

					<div class="form-group" id="stat_section">
						<label for="field-2" class="col-sm-3 control-label"><?php echo get_phrase('Section'); ?></label>
		                    <div class="col-sm-5">
		                        <select name="section_id" class="form-control" id="section_selector_holder">
		                            <option value=""><?php echo get_phrase('Select-Class'); ?></option>
			                    </select>
			                </div>
					</div>


                <div class="form-group" id="ireg_status_holder" style="display:none;">
                    <label for="field-2" class="col-sm-3 control-label"><?php echo get_phrase('Subject'); ?></label>
                    <div class="col-sm-5">
                        <select multiple size="0" class="form-control subject_selector_holder">
                        </select>
                    </div>
                    <br>
                    <div class="row">
                        <div class="btn btn-success btn-sm" id="sub_get">Get Subject</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="text-center">
                                <select multiple size="0" class="form-control" id="all_data" name="subject_selected[]" style="width:500px !important;margin:0px auto !important;">
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label"><?php echo get_phrase('Birthday'); ?></label>
						<div class="col-sm-5">
							<input type="text" class="form-control mydatepicker" name="birthday" value="" placeholder="dd-mm-yyyy">
						</div> 
					</div>
					
					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label"><?php echo get_phrase('Sex'); ?></label>
						<div class="col-sm-5">
							<select name="sex" class="form-control selectboxit">
                              <option value=""><?php echo get_phrase('Select'); ?></option>
                              <option value="male"><?php echo get_phrase('Male'); ?></option>
                              <option value="female"><?php echo get_phrase('Female'); ?></option>
                          </select>
						</div> 
					</div>
					
					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label"><?php echo get_phrase('Address'); ?></label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="address" value="" >
						</div> 
					</div>
					
					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label"><?php echo get_phrase('Phone'); ?></label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="phone" value="" >
						</div> 
					</div>
                    
					<div class="form-group">
						<label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Email'); ?></label>
						<div class="col-sm-5">
							<input type="email" class="form-control" name="email" value=""<?=form_error('email'); ?>>
						</div>
					</div>
					
					<div class="form-group">
						<label for="field-2" class="col-sm-3 control-label"><?php echo get_phrase('Password'); ?></label>
						<div class="col-sm-5">
                                <input id="password-field" type="password" class="form-control" name="password" value="">
                                <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password text-success"></span>
						</div>

					</div>
					<div class="form-group">
						<label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Photo'); ?></label>
						<div class="col-sm-5">
							<div class="fileinput fileinput-new" data-provides="fileinput">
								<div class="fileinput-new thumbnail" style="width: 100px; height: 100px;" data-trigger="fileinput">
									<img src="http://placehold.it/200x200" alt="...">
								</div>
								<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px"></div>
								<div>
									<span class="btn btn-info btn-file">
										<span class="fileinput-new"><?php echo get_phrase('Upload'); ?></span>
										<span class="fileinput-exists"><?php echo get_phrase('Change'); ?></span>
										<input type="file" name="userfile" accept="image/*">
									</span>
									<a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput"><?php echo get_phrase('Delete'); ?></a>
								</div>
							</div>
						</div>
					</div>
                    
                    <div class="form-group">
						<div class="col-sm-offset-3 col-sm-5">
							<button type="submit" class="btn btn-info"><?php echo get_phrase('Add'); ?></button>
						</div>
					</div>
                <?php echo form_close();?>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(".toggle-password").click(function () {
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });
	function get_class_sections(class_id) 
	{
    	$.ajax({
            url: '<?php echo base_url();?>index.php?admin/get_class_section/' + class_id ,
            success: function(response)
            {
                jQuery('#section_selector_holder').html(response);
            }
        });

        $.ajax({
            url: '<?php echo base_url();?>index.php?admin/get_class_subject/' + class_id ,
            success: function(response)
            {
                jQuery('.subject_selector_holder').html(response);

                $('.subject_selector_holder').attr('size',8);
            }
        });
    }
    $(document).ready(function(){
        $("select.status_id").change(function(){
            var status = $(this).children("option:selected").val();
            if(status == 1){
                $('#stat_section').css('display','block');
                $('#ireg_status_holder').css('display','none');

            }else if(status==2){
                $('#stat_section').css('display','none');
                $('#ireg_status_holder').css('display','block');

            }else{
                $('#stat_section').css('display','none');
                $('#stat_section').css('display','none');
            }
        });
        $('#sub_get').click(function (e) {
            $('.subject_selector_holder').find('option:selected').clone().appendTo('#all_data');

        });
        $('form').submit(function(){
            if(!$('#all_data').val()){
                $('#all_data option').prop("selected", true);
            }
        });
    });
</script>