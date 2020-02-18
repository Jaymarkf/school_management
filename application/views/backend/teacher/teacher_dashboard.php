
<div class="modal fade modal_advertise" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="row">

                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Ads</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="text-center"> <img src="<?php echo base_url().'uploads/tmp/advertise.jpg'; ?>" width="800" height="400"/></div>
                        </div>
                        <br><br><br>
                        <div class="text-center"><p><?php echo $this->db->get_where('settings',array('type'=>'advertise'))->row()->description;?></p></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    $(window).on('load',function(){
        <?php
        $switch = $this->db->get_where('settings',array('type'=>'ads_switch'))->row()->description;
        if($switch == 1){
            echo "$('.modal_advertise').modal({backdrop: 'static', keyboard: false});";
            echo "$('.modal_advertise').modal('show');";
        }
        ?>
    });
</script>

<div class="row bg-title">
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
        <h4 class="page-title"><?php echo get_phrase('Teacher-Dashboard');?></h4> </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>index.php?teacher/teacher_dashboard"><?php echo $system_title; ?></a></li>
            <li class="active"><?php echo get_phrase('Teacher-Dashboard');?></li>
        </ol>
    </div>
</div>

<div class="row">
</div>

<div class="row">
<div class="col-md-6">
                <div class="alert alert-warning">
                    <div class="icon"><i class="entypo-chart-bar"></i></div>
                    <?php 
                        $check  =   array(  'timestamp' => strtotime(date('Y-m-d')) , 'status' => '1' );
                        $query = $this->db->get_where('attendance' , $check);
                        $present_today      =   $query->num_rows();
                        ?>
                    <h4><font color="white"><?php echo get_phrase('Attendance');?></font></h4>
                    <p>Present Student Today: </p>
                    <h3><font color="white"><?php echo $present_today;?></font></h3>
                </div>
                
            </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-wrapper p-b-10 collapse in">
                               <div class="card-body card-padding">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                      <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                      </ol>

        <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="<?php echo base_url();?>uploads/slider/slider1.png" alt="">
                    </div>
                    <div class="item">
                        <img src="<?php echo base_url();?>uploads/slider/slider2.png" alt="">
                    </div>
                    <div class="item">
                        <img src="<?php echo base_url();?>uploads/slider/slider3.png" alt="">
                    </div>
        </div>

        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="zmdi zmdi-chevron-left" aria-hidden="true"></span>
            <span class="sr-only"><?php echo get_phrase('Prev');?></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="zmdi zmdi-chevron-right" aria-hidden="true"></span>
            <span class="sr-only"><?php echo get_phrase('Next');?></span>
        </a>
        </div>
    </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
                    <div class="col-md-6">
                        <div class="white-box">
                            <h3 class="box-title"><?php echo get_phrase('Last-News');?></h3>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                <th style="text-align: center;">#</th>
                                <th style="text-align: center;"><div><?php echo get_phrase('Title');?></div></th>
                                <th style="text-align: center;"><div><?php echo get_phrase('Options');?></div></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php 
                                        $counter = 1;
                                        $this->db->where('news_status' , 1);
                                        $this->db->limit(7);
                                        $this->db->order_by('news_id' , 'desc');
                                        $news   =   $this->db->get('news')->result_array();
                                        foreach($news as $row):?>
                                        <tr>
                                            <td style="text-align: center;"><?php echo $counter++; ?></td>
                                            <td style="text-align: center;">
            <a href="<?php echo base_url();?>index.php?teacher/newsroom/overview/<?php echo $row['news_code'];?>"><?php echo $row['title'];?></a>
    </td>
    <td style="text-align: center;"><?php echo substr($row['description'], 0, 30);?>...</td>
                                        </tr>
                                        <?php endforeach;?>
                                    </tbody>
                                </table>
            </div>
        </div>
    </div>

                <div class="col-md-6 col-lg-6 col-sm-12">
          <div class="white-box">
            <h3 class="box-title"><?php echo get_phrase('Events');?></h3>
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th style="text-align: center;">#</th>
                    <th style="text-align: center;"><div><?php echo get_phrase('Title');?></div></th>
                    <th style="text-align: center;"><div><?php echo get_phrase('From');?></div></th>
                    <th style="text-align: center;"><div><?php echo get_phrase('To');?></div></th>
                    <th style="text-align: center;"><div><?php echo get_phrase('Type');?></div></th>
                  </tr>
                </thead>
                <tbody>
                 <?php $counter = 1;
                        $this->db->limit(7);
                        $this->db->order_by('event_id' , 'desc');
                        $events =   $this->db->get('events')->result_array();
                        foreach($events as $row2):?>
                  <tr>
                    <td style="text-align: center;"><?php echo  $counter++;?></td>
                    <td style="text-align: center;"><?php echo $row2['title'];?></td>
                    <td style="text-align: center;"><?php echo $row2['datefrom'];?></td>
                    <td style="text-align: center;"><span class="text-success"><?php echo $row2['dateto'];?></span></td>
                    <td style="text-align: center;"><span class="label label-info label-rouded"><?php echo $row2['type'];?></span> </td>
                  </tr>
                  <?php endforeach;?>
                </tbody>
              </table>
          </div>
        </div>
</div>
</div>