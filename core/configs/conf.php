<?php 
# @*************************************************************************@
# @ Software author: Mansur Terla (Mansur_TL)                               @
# @ UI/UX Designer & Web developer ;)                                       @
# @                                                                         @
# @*************************************************************************@
# @ Instagram: https://www.instagram.com/mansur_tl                          @
# @ VK: https://vk.com/mansur_tl_uiux                                       @
# @ Envato: http://codecanyon.net/user/mansur_tl                            @
# @ Behance: https://www.behance.net/mansur_tl                              @
# @ Telegram: https://t.me/mansurtl_contact                                 @
# @*************************************************************************@
# @ E-mail: mansurtl.contact@gmail.com                                      @
# @ Website: https://www.mansurtl.com                                       @
# @*************************************************************************@
# @ ColibriSM - The Ultimate Social Network PHP Script                      @
# @ Copyright (c)  ColibriSM. All rights reserved                           @
# @*************************************************************************@

# Determines how often Google ads appear in feeds (Only integer values are allowed) 
define("GADS_TIMELINE_FREQ", 10);

$sql_db_host = getenv('DB_HOST') ?: 'db';
$sql_db_user = getenv('DB_USER') ?: 'colibri';
$sql_db_pass = getenv('DB_PASS') ?: 'colibri_pass';
$sql_db_name = getenv('DB_NAME') ?: 'colibri';
$site_url    = getenv('SITE_URL') ?: 'http://localhost:8080';

$sql_db_host = getenv('DB_HOST') ?: 'db';
$sql_db_user = getenv('DB_USER') ?: 'colibri';
$sql_db_pass = getenv('DB_PASS') ?: 'colibri_pass';
$sql_db_name = getenv('DB_NAME') ?: 'colibri';
$site_url    = getenv('SITE_URL') ?: 'http://localhost:8080';
