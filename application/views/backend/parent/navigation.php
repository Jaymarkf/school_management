        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar <?php if($page_name == 'student_bulk') echo 'navbar-collapse';?>">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search hidden-sm hidden-md hidden-lg">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search..."> <span class="input-group-btn">
                            <button class="btn btn-default" type="button"> <i class="fa fa-search"></i> </button>
                            </span> </div>
                    </li>
                    <hr>
                    <li> <a href="<?php echo base_url(); ?>index.php?parents/parents_dashboard" class="waves-effect"><i class="ti-dashboard"></i> <span class="hide-menu"><?php echo get_phrase('Dashboard');?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?parents/events" class="waves-effect"><i class="fa fa-calendar"></i> <span class="hide-menu"><?php echo get_phrase('Events'); ?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?parents/teacher_list" class="waves-effect"><i class="fa fa-users"></i> <span class="hide-menu"><?php echo get_phrase('Teachers'); ?></span></a>
                    </li>
                     <li> <a href="<?php echo base_url(); ?>index.php?parents/attendance_report" class="waves-effect"><i class="ti-check-box"></i> <span class="hide-menu"><?php echo get_phrase('Attendance-Report'); ?></span></a>
                    </li>
                    <li><a href="javascript:void(0)" class="waves-effect"><i data-icon="F" class="ti-alarm-clock"></i> <span class="hide-menu"><?php echo get_phrase('Schedules'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                        <li> <a href="javascript:void(0)" class="waves-effect"><?php echo get_phrase('Class-Routine'); ?><span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                            <?php $children_of_parent = $this->db->get_where('student' , array('parent_id' => $this->session->userdata('parent_id')))->result_array();
                            foreach ($children_of_parent as $row): ?>
                                <li> <a href="<?php echo base_url(); ?>index.php?parents/class_routine/<?php echo $row['student_id']; ?>"><?php echo $row['name']; ?></a> </li>
                                <?php endforeach; ?>
                            </ul>
                        </li>
                        <li> <a href="javascript:void(0)" class="waves-effect"><?php echo get_phrase('Exam-Routine'); ?><span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                            <?php $children_of_parent = $this->db->get_where('student' , array('parent_id' => $this->session->userdata('parent_id')))->result_array();
                            foreach ($children_of_parent as $row): ?>
                                <li> <a href="<?php echo base_url(); ?>index.php?parents/exam/<?php echo $row['student_id']; ?>"><?php echo $row['name']; ?></a> </li>
                                <?php endforeach; ?>
                            </ul>
                        </li>
                    </ul>
                    </li>
                    <li><a href="javascript:void(0)" class="waves-effect"><i data-icon="F" class="ti-alarm-clock"></i> <span class="hide-menu"><?php echo get_phrase('Grades'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li> <a href="javascript:void(0)" class="waves-effect"><?php echo get_phrase('View Grades'); ?><span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <?php $children_of_parent = $this->db->get_where('student' , array('parent_id' => $this->session->userdata('parent_id')))->result_array();
                                    foreach ($children_of_parent as $row): ?>
                                        <li> <a href="<?php echo base_url(); ?>index.php?parents/grades/<?php echo $row['student_id']; ?>"><?php echo $row['name']; ?></a> </li>
                                    <?php endforeach; ?>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li> <a href="javascript:void(0);" class="waves-effect"><i class="fa fa-money"></i> <span class="hide-menu"><?php echo get_phrase('Students-Payments'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                          <?php $children_of_parent = $this->db->get_where('student' , array('parent_id' => $this->session->userdata('parent_id')))->result_array();
                            foreach ($children_of_parent as $row): ?>
                             <li> 
                             <a href="<?php echo base_url(); ?>index.php?parents/invoice/<?php echo $row['student_id'];?>"><?php echo $row['name'];?></a>
                             </li>
                         <?php endforeach; ?>
                        </ul>
                    </li>
                     <li> <a href="<?php echo base_url(); ?>index.php?parents/news_" class="waves-effect"><i class="fa fa-file-text-o"></i> <span class="hide-menu"><?php echo get_phrase('News'); ?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?parents/message" class="waves-effect"><i class="fa fa-envelope"></i> <span class="hide-menu"><?php echo get_phrase('Messages'); ?></span></a>
                    </li>
        </ul>
    </div>
</div>