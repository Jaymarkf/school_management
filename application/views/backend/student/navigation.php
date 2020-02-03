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
                    <li> <a href="<?php echo base_url(); ?>index.php?student/student_dashboard" class="waves-effect"><i class="ti-dashboard"></i> <span class="hide-menu"><?php echo get_phrase('Dashboard');?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?student/teacher_list" class="waves-effect"><i class="fa fa-users"></i> <span class="hide-menu"><?php echo get_phrase('Teachers'); ?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?student/events" class="waves-effect"><i class="fa fa-calendar"></i> <span class="hide-menu"><?php echo get_phrase('Events'); ?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?<?php echo $account_type; ?>/subject" class="waves-effect"><i class="ti-pencil-alt"></i> <span class="hide-menu"><?php echo get_phrase('Subjects'); ?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?<?php echo $account_type; ?>/attendance_report" class="waves-effect"><i class="ti-check-box"></i> <span class="hide-menu"><?php echo get_phrase('Attendance-Report'); ?></span></a>
                    </li>
                    <li> <a href="javascript:void(0);" class="waves-effect"><i class="ti-id-badge"></i> <span class="hide-menu"><?php echo get_phrase('Grades'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-third-level">
                            <li> <a href="<?php echo base_url(); ?>index.php?student/grades"><?php echo get_phrase('View My Grades'); ?></a></li>
                        </ul>
                    </li>

                    <li><a href="javascript:void(0)" class="waves-effect"><i data-icon="F" class="ti-alarm-clock"></i> <span class="hide-menu"><?php echo get_phrase('Schedules'); ?><span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                        <li> <a href="<?php echo base_url(); ?>index.php?<?php echo $account_type; ?>/class_routine"><?php echo get_phrase('Class-Routine'); ?></a> 
                        </li>
                        <li> <a href="<?php echo base_url(); ?>index.php?<?php echo $account_type; ?>/exam"><?php echo get_phrase('Exam-Routine'); ?></a>
                        </li>
                        </ul>
                    </li>
                        <li> <a href="<?php echo base_url(); ?>index.php?<?php echo $account_type; ?>/invoice" class="waves-effect"><i class="fa fa-money"></i> <span class="hide-menu"><?php echo get_phrase('Students-Payments'); ?></span></a>
                        </li>
                    </li>
                     <li> <a href="<?php echo base_url(); ?>index.php?student/news_" class="waves-effect"><i class="fa fa-file-text-o"></i> <span class="hide-menu"><?php echo get_phrase('News'); ?></span></a>
                    </li>
                    <li> <a href="#" class="waves-effect"><i class="fa fa-envelope"></i> <span class="hide-menu"><?php echo get_phrase('Voting'); ?></span></a>
                    </li>
                    <li> <a href="<?php echo base_url(); ?>index.php?student/message" class="waves-effect"><i class="fa fa-envelope"></i> <span class="hide-menu"><?php echo get_phrase('Messages'); ?></span></a>
                    </li>
        </ul>
    </div>
</div>