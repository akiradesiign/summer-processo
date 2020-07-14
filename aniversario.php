<?php
    function date($userFunction, $optionFunction) {
        $user = $userFunction;
        $option = $optionFunction;

        // Select SQL
        $commandSQL = "select
                    nm_user, dt_user, cd_user
                    from tb_user
                    where cd_user = '$user'";
        $row = $link->query($commandSQL);
        $data = mysqli_fetch_assoc($row);

        // Getting dates
        $userDate = $data['dt_user'];                    
        $currentDate = date('Y-m-d');

        // Verifications
        if($option === 'days' || $option === 'months' || $option === 'years') {
            $diff = strtotime($currentDate) - strtotime($userDate);
            $dates['days'] = round(floor($diff / (60*60*24)),0);
            $dates['months'] = round($dates['days'] / 30,0);
            $dates['years'] = round($dates['months'] / 12,0);

            // Return Days
            if($option === 'days') {
                return $dates['days'];
                die;
            }

            // Return Months
            if($option === 'months') {
                return $dates['months'];
                die;
            }
            
            // Return Years
            if($option === 'years') {
                return $dates['years'];
                die;
            }
        }
        else {
            // Return Complete Date
            $userDate = new DateTime($data['dt_user']);
            $currentDate = new DateTime(date('Y-m-d'));
            $diff = $currentDate->diff($userDate);
            if ($diff->m == 0) {
                $dates['complete'] = $diff->y . ' anos ' . ' e ' . $diff->d . ' dias';
            } else {
                $dates['complete'] = $diff->y . ' anos, ' . $diff->m . ' meses e ' . $diff->d . ' dias';
            }
            return $dates['complete'];
        }
    }
?>
