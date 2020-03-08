<?php $running_year = $this->db->get_where('settings' , array('type' => 'running_year'))->row()->description; ?>
<?php echo form_open(base_url() . 'index.php?teacher/attendance_report_selector/'); ?>

<div class="row bg-title">
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
        <h4 class="page-title"><?php echo get_phrase('Attendance-Report'); ?></h4> </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url();?>index.php?admin/admin_dashboard"><?php echo get_phrase('Dashboard'); ?></a></li>
            <li class="active"><?php echo get_phrase('Attendance-Report'); ?></li>
        </ol>
    </div>
</div>

<div class="white-box">
<div class="row">
    <?php
    $query = $this->db->get('class');
    if ($query->num_rows() > 0):
        $class = $query->result_array();?>
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Class');?></label>
                <select class="form-control selectboxit" name="class_id" onchange="select_section(this.value)">
                    <option value=""><?php echo get_phrase('Select');?></option>
                    <?php foreach ($class as $row): ?>
                        <option value="<?php echo $row['class_id']; ?>"<?php if ($class_id == $row['class_id']) echo 'selected'; ?> ><?php echo $row['name']; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
    <?php endif; ?>

    <?php
    $query = $this->db->get_where('section', array('class_id' => $class_id));
    if ($query->num_rows() > 0):
        $sections = $query->result_array();
        ?>
        <div id="section_holder">
            <div class="col-md-3">
                <div class="form-group">
                    <label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Section');?></label>
                    <select class="form-control selectboxit" name="section_id">
                        <?php foreach ($sections as $row): ?>
                            <option value="<?php echo $row['section_id']; ?>"
                                    <?php if ($section_id == $row['section_id']) echo 'selected'; ?>><?php echo $row['name']; ?></option>
                                <?php endforeach; ?>
                    </select>
                </div>
            </div>
        </div>
    <?php endif; ?>
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



    <div class="col-md-3">
        <div class="form-group">
            <label class="control-label" style="margin-bottom: 5px;"><?php echo get_phrase('Month');?></label>
            <select name="month" class="form-control selectboxit" id="month">
                <?php
               for ($i = 1; $i <= 12; $i++):
                if ($i == 1)
                    $m = get_phrase('January');
                else if ($i == 2)
                    $m = get_phrase('February');
                else if ($i == 3)
                    $m = get_phrase('March');
                else if ($i == 4)
                    $m = get_phrase('April');
                else if ($i == 5)
                    $m = get_phrase('May');
                else if ($i == 6)
                    $m = get_phrase('June');
                else if ($i == 7)
                    $m = get_phrase('July');
                else if ($i == 8)
                    $m = get_phrase('August');
                else if ($i == 9)
                    $m = get_phrase('September');
                else if ($i == 10)
                    $m = get_phrase('October');
                else if ($i == 11)
                    $m = get_phrase('November');
                else if ($i == 12)
                    $m = get_phrase('December');
                    ?>
                    <option value="<?php echo $i; ?>"
                            <?php if ($month == $i) echo 'selected'; ?>  >
                                <?php echo $m; ?>
                    </option>
                    <?php
                endfor;
                ?>
            </select>
        </div>
    </div>
    <input type="hidden" name="year" value="<?php echo $running_year; ?>">
    <div class="col-md-3" style="margin-top: 20px;">
        <button type="submit" class="btn btn-info"><?php echo get_phrase('View');?></button>
    </div>
</div>

<?php if ($class_id != '' && $section_id != '' && $month != '' && $subject_id != ''): ?>
    <br>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4"></div>
    </div>
    <hr />
    <div id="wew" class="row">
        <div class="col-md-12">
         <center><p><i class="fa fa-check-circle" style="color: #00a651;"></i> <?php echo get_phrase('Present');?>&nbsp;&nbsp;&nbsp;<i class="fa fa-times-circle" style="color: #ee4749;"></i> <?php echo get_phrase('Absent');?>&nbsp;&nbsp;&nbsp;<i class="fa fa-certificate" style="color: #fec42d;"></i>Late</p></center>
         <hr>
         <div class="table-responsive" id="tbd">
            <table class="table table-bordered" id="my_table">
                <thead>
                    <tr>
                        <td style="text-align: center;width:500px !important;">
    <?php echo get_phrase('Students');?> <i class="entypo-down-thin"></i> | <?php echo get_phrase('Date');?> <i class="entypo-right-thin"></i>
                        </td>
    <?php
    $year = explode('-', $running_year);
    $days = cal_days_in_month(CAL_GREGORIAN, $month, $year[0]);
    for ($i = 1; $i <= $days; $i++) {
        ?>
                            <td style="text-align: center;"><?php echo $i; ?></td>
                    <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php $data = array();
//                            $students = $this->db->get_where('enroll', array('class_id' => $class_id, 'year' => $running_year, 'section_id' => $section_id))->result_array();
                    $qryd = '(class_id = '.$class_id.' and section_id = '.$section_id.' and year = "'.$running_year. '" and find_in_set("'.$subject_id.'",selected_subject))
                            or
                            (class_id = '.$class_id.' and section_id = 0 and year = "'.$running_year. '"  and find_in_set("'.$subject_id.'",selected_subject))
                            ';
                    //die($q);
                    $this->db->where($qryd);
                    $students =  $this->db->get('enroll')->result_array();
//                    echo  '<pre>';
//                    print_r($students);
//                    echo '</pre>';
                            foreach ($students as $row): ?>
                        <tr>
                            <td style="text-align:center;font-size:12px;">
                            <?php echo $this->db->get_where('student', array('student_id' => $row['student_id']))->row()->name; ?>
                            </td>
                            <?php
                            $status = 0;
                            for ($i = 1; $i <= $days; $i++) {
                                $timestamp = strtotime($i . '-' . $month . '-' . $year[0]);
                                $this->db->group_by('timestamp');
                                $attendance = $this->db->get_where('attendance', array('class_id' => $class_id, 'year' => $running_year, 'timestamp' => $timestamp, 'student_id' => $row['student_id'],'subject_id'=>$subject_id))->result_array();
                                foreach ($attendance as $row1):
                                    $month_dummy = date('d', $row1['timestamp']);
                                    if ($i == $month_dummy)
                                    $status = $row1['status'];
                                endforeach;
                                ?>
                                <td style="text-align: center;">
                            <?php if ($status == 1) { ?>
                                        <i class="fa fa-check-circle" title="<?php echo get_phrase('Present');?>" data-toggle="tooltip" style="color: #00a651;"></i></i>
                            <?php  } if($status == 2)  { ?>
                                        <i class="fa fa-times-circle" title="<?php echo get_phrase('Absent');?>" data-toggle="tooltip" style="color: #ee4749;"></i>
                            <?php  } if($status == 3)  { ?>
                                        <i class="fa fa-certificate" title="<?php echo get_phrase('Late');?>" data-toggle="tooltip" style="color: #fec42d;"></i>
                             <?php  } $status =0;?>
                                </td>
        <?php } ?>
    <?php endforeach; ?>
                    </tr>
    <?php ?>
                </tbody>
            </table>

        </div>
    </div>
        <a class="btn btn-success btn-lg" id="btnprint">PRINT</a>
    </div>
    </div>
<?php endif; ?>

<script type="text/javascript">
    $(document).ready(function() {
        if ($.isFunction($.fn.selectBoxIt)) {
            $("select.selectboxit").each(function (i, el) {
                var $this = $(el),
                    opts = {
                        showFirstOption: attrDefault($this, 'first-option', true),
                        'native': attrDefault($this, 'native', false),
                        defaultText: attrDefault($this, 'text', ''),
                    };

                $this.addClass('visible');
                $this.selectBoxIt(opts);
            });
        }




    });

    $('#btnprint').click(function(){

        var elem = $('#tbd');
        PrintElem(elem);
        Popup(data);
    });
    function PrintElem(elem)
    {
        Popup($(elem).html());
    }
    function Popup(data)
    {
        var getsection = '<?php echo $this->db->get_where("section",array("section_id"=>$section_id))->row()->name; ?>';
        var getsubject = '<?php echo $this->db->get_where("subject",array("subject_id"=>$subject_id))->row()->name; ?>';
        var getclass = '<?php echo $this->db->get_where("class",array("class_id"=>$class_id))->row()->name; ?>';

      var a = '<link rel=\"stylesheet\" href=\"https:\/\/maxcdn.bootstrapcdn.com\/bootstrap\/3.4.1\/css\/bootstrap.min.css\"><style>' +
          '@media print {' +
          'body {-webkit-print-color-adjust: exact;}' +
          '}<\/style>';
      var b = '<script src=\"https:\/\/ajax.googleapis.com\/ajax\/libs\/jquery\/3.4.1\/jquery.min.js\"><\/script>';
      var c = '<script src=\"https:\/\/maxcdn.bootstrapcdn.com\/bootstrap\/3.4.1\/js\/bootstrap.min.js\"><\/script>';



        var mywindow = window.open('', 'my div', 'height=400,width=700');
        mywindow.document.write('<html><head><title></title>');
        mywindow.document.write('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">'+a+b+c+'</head><body>');
        mywindow.document.write('<br><br><br><br>' +
            '<div class=\"row\">' +
            '<div class=\"col-md-6\">' +
            '<center><p>Date: ________________<\p><\/center>' +
            '<\/div>' +

            '<div class=\"col-md-6\">' +
            '<center><p><label>Class: &nbsp;&nbsp</label>'+getclass+'<\p><\/center>' +
            '' +
            '<\/div>' +
            '<\/div>' +
            '' +
            '<div class=\"row\">' +
            '<div class=\"col-md-6\">' +
            '<center><p><label>Section: &nbsp;&nbsp</label>'+getsection+'<\p><\/center>' +
            '<\/div>' +

            '<div class=\"col-md-6\">' +
            '<center><p><label>Subject: &nbsp;&nbsp</label>'+getsubject+'<\p><\/center>' +
            '' +
            '<\/div>' +
            '<\/div>' +
            '<div class=\"row\">' +
            '' +
            '<center><p><i class=\"fa fa-check-circle\" style=\"color: #00a651;\">Present&nbsp;&nbsp;&nbsp;<\/i><i class=\"fa fa-times-circle\" style=\"color: #ee4749;\"><\/i>Absent&nbsp;&nbsp;&nbsp;<i class=\"fa fa-certificate\" style=\"color: #fec42d;\"><\/i>Late<\/p></\center>' +
            '<\/div><div class=\"container-fluid\" style=\"width:1200px;\">'+data+'<\/div>');
        mywindow.document.write('</body></html>');
        mywindow.document.close();
        mywindow.print();

    }
</script>
<script type="text/javascript">
    function select_section(class_id) {
        $.ajax({
            url: '<?php echo base_url(); ?>index.php?admin/get_section/' + class_id,
            success: function (response)
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