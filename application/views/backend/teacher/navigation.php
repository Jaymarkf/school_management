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
                    <li> <a href="<?php echo base_url(); ?>index.php?teacher/teacher_dashboard" class="waves-effect"><i class="ti-dashboard"></i> <span class="hide-menu"><?php echo get_phrase('Dashboard');?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?teacher/teacher_list" class="waves-effect"><i class="fa fa-users"></i> <span class="hide-menu"><?php echo get_phrase('Teachers'); ?></span></a>
                    </li>
                    <li> <a href="javascript:void(0);" class="waves-effect"><i class="ti-medall"></i> <span class="hide-menu"><?php echo get_phrase('Students-Information'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                        <?php
                        $classes = $this->db->get('class')->result_array();
                        foreach ($classes as $row):
                            ?>
                            <li> <a href="<?php echo base_url(); ?>index.php?teacher/students_area/<?php echo $row['class_id']; ?>"><?php echo $row['name']; ?></a></li>
                             <?php endforeach; ?>
                        </ul>
                    </li>
                     <li> <a href="javascript:void(0);" class="waves-effect"><i class="ti-pencil-alt"></i> <span class="hide-menu"><?php echo get_phrase('Subjects'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                        <?php $classes = $this->db->get('class')->result_array();
                            foreach ($classes as $row): ?>
                        
                            <li>
                            <a href="<?php echo base_url(); ?>index.php?teacher/courses/<?php echo $row['class_id']; ?>"><?php echo $row['name']; ?>
                            </a>
                            </li>
                             <?php endforeach; ?>
                        </ul>
                    </li>
                     <li> <a href="javascript:void(0);" class="waves-effect"><i class="ti-check-box"></i> <span class="hide-menu"><?php echo get_phrase('Attendance'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                        <?php
                $classes = $this->db->get('class')->result_array();
                foreach ($classes as $row):
                    ?>
                            <li> <a href="<?php echo base_url(); ?>index.php?teacher/manage_attendance/<?php echo $row['class_id']; ?>/<?php echo $this->session->userdata('teacher_id'); ?>"><?php echo $row['name']; ?></a></li>

                              <?php endforeach; ?>
                            <li> <a href="<?php echo base_url(); ?>index.php?teacher/attendance_report"><?php echo get_phrase('Attendance-Report'); ?></a></li>
                        </ul>
                    </li>
                    <li> <a href="javascript:void(0);" class="waves-effect"><i class="ti-id-badge"></i> <span class="hide-menu"><?php echo get_phrase('Grades'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-third-level">
                            <li> <a href="<?php echo base_url(); ?>index.php?teacher/grades"><?php echo get_phrase('Manage Grades'); ?></a></li>
                        </ul>
                    </li>
                     <li> <a href="javascript:void(0)" class="waves-effect"><i data-icon="F" class="ti-alarm-clock"></i> <span class="hide-menu"><?php echo get_phrase('Schedules'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                        <li> <a href="javascript:void(0)" class="waves-effect"><?php echo get_phrase('Class-Routine'); ?><span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                            <?php
                            $classes = $this->db->get('class')->result_array();
                             foreach ($classes as $row):?>
                                <li> <a href="<?php echo base_url(); ?>index.php?teacher/class_routine/<?php echo $row['class_id']; ?>"><?php echo $row['name']; ?></a> </li>
                                <?php endforeach; ?>
                            </ul>
                        </li>
                        <li> <a href="javascript:void(0)" class="waves-effect"><?php echo get_phrase('Exam-Routine'); ?><span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                            <?php
                $classes = $this->db->get('class')->result_array();
                foreach ($classes as $row):?>
                                <li> <a href="<?php echo base_url(); ?>index.php?teacher/exam_routine/<?php echo $row['class_id']; ?>"><?php echo $row['name']; ?></a> </li>
                                <?php endforeach; ?>
                            </ul>
                        </li>
                    </ul>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?teacher/events" class="waves-effect"><i class="fa fa-calendar"></i> <span class="hide-menu"><?php echo get_phrase('Events'); ?></span></a>
                    </li>

                     <li> <a href="<?php echo base_url(); ?>index.php?teacher/circulares" class="waves-effect"><i class="fa fa-file-text-o"></i> <span class="hide-menu"><?php echo get_phrase('News'); ?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?teacher/message" class="waves-effect"><i class="fa fa-envelope"></i> <span class="hide-menu"><?php echo get_phrase('Messages'); ?></span></a>
                    </li>
        </ul>
    </div>
</div>