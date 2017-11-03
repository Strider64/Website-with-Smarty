<?php

namespace Library\Calendar;

use DateTime;
use Library\Database\Database;
use Library\Calendar\Location;

class Calendar extends Location {

    protected $date = \NULL;
    protected $page = 0;
    public $output = \NULL;
    protected $username = \NULL;
    protected $user_id = \NULL;
    protected $query = \NULL;
    protected $stmt = \NULL;
    protected $urlDate = \NULL;
    protected $sendDate = \NULL;
    protected $prev = \NULL;
    public $current = \NULL;
    protected $next = \NULL;
    protected $month = \NULL;
    protected $day = \NULL;
    protected $year = \NULL;
    protected $days = \NULL;
    protected $currentDay = \NULL;
    protected $highlightToday = \NULL;
    protected $highlightHoliday = \NULL;
    protected $isHoliday = \NULL;
    protected $prevMonth = \NULL;
    protected $nextMonth = \NULL;
    public $selectedMonth = \NULL;
    public $n = \NULL;
    public $result = \NULL;
    protected $calendar = \NULL; // The HTML Calender:
    protected $alphaDay = [0 => "Sun", 1 => "Mon", 2 => "Tue", 3 => "Wed", 4 => "Thu", 5 => "Fri", 6 => "Sat"];
    protected $imporantDates = [];
    protected $myPage = \NULL;
    protected $size = \NULL;
    protected $now = \NULL;
    protected $monthlyChange = \NULL;

    /* Constructor to create the calendar */

    public function __construct($date = null, $size = 100) {
        $this->selectedMonth = new \DateTime($date, new \DateTimeZone("America/Detroit"));
        $this->current = new \DateTime($date, new \DateTimeZone("America/Detroit"));
        $this->current->modify("first day of this month");
        $this->n = $this->current->format("n"); // Current Month as a number (1-12):
        $this->size = $size;
    }

    public function fileLocation() {
        return $this->returnLocation();
    }
    
    public function set_user_id($user_id = -1) {
        $this->user_id = $user_id;
    }

    public function checkIsAValidDate($myDateString) {
        return (bool) strtotime($myDateString);
    }
    public function changeMonth($setDate) {
        self::__construct($setDate, $size);
    }
    public function phpDate() {
        $setDate = filter_input(INPUT_GET, 'location', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $valid = $this->checkIsAValidDate($setDate);
        if (isset($setDate) && strlen($setDate) === 10 && $valid) {
            self::__construct($setDate);
        }
    }

    public function returnDate() {
        return $this->selectedMonth;
    }

    public function getHolidayNames() {
        return $this->isHoliday->checkForHoliday($this->selectedMonth->format('Y-m-j'));
    }

    protected function checkForEntry($calDate) {
        $blog = "blog.php";
        $db = Database::getInstance();
        $pdo = $db->getConnection();
        $this->username = isset($_SESSION['user']) ? $_SESSION['user']->username : \NULL;

        $this->query = 'SELECT 1 FROM cms WHERE page_name=:page_name AND DATE_FORMAT(date_added, "%Y-%m-%d")=:date_added AND user_id=:user_id';

        $this->stmt = $pdo->prepare($this->query);

        $this->stmt->execute([':page_name' => $blog ,':date_added' => $calDate, ':user_id' => $this->user_id]);

        $this->result = $this->stmt->fetch();

        /* If result is true there is data in day, otherwise no data */
        if ($this->result) {
            return \TRUE;
        } else {
            return \FALSE;
        }
    }

    /* Highlight Today's Date on Calendar */

    protected function currentDays() {
        $this->result = $this->checkForEntry($this->current->format("Y-m-d"));
        if ($this->now->format("F j, Y") === $this->current->format("F j, Y")) {
            $this->calendar .= "\t\t" . '<td class="background">';
            $this->calendar .= '<a class="foreground golden" href="calendar.php?date=' . $this->current->format('Y-m-d') . '">' . $this->current->format("j") . '</a>';
//            if ($this->result) {
//                $this->calendar .= '<a class="foreground golden" href="daily/' . $this->current->format('Y-m-d') . '">' . $this->current->format("j") . '</a>';
//            } else {
//                $this->calendar .= '<a class="foreground inactiveLink" href="daily/' . $this->current->format('Y-m-d') . '">' . $this->current->format("j") . '</a>';
//            }
            
            $this->calendar .= "</td>\n";
        } else {
            $this->calendar .= "\t\t" . '<td>';
            $this->calendar .= '<a class="current" href="calendar.php?date=' . $this->current->format('Y-m-d') . '">' . $this->current->format("j") . '</a>';
//            if ($this->result) {
//                $this->calendar .= '<a class="current" href="daily/' . $this->current->format('Y-m-d') . '">' . $this->current->format("j") . '</a>';
//            } else {
//                $this->calendar .= '<a class="current inactiveLink" href="daily/' . $this->current->format('Y-m-d') . '">' . $this->current->format("j") . '</a>';
//            }           
            $this->calendar .= "</td>\n";
        }
    }

    /* Draw Days (make Table Cells) on Calendar */

    protected function drawDays() {

        $this->now = new \DateTime("Now", new \DateTimeZone("America/Detroit"));
        $this->calendar .= "\t<tr>\n";
        $x = 1;
        while ($x <= 7) {
            if ($this->selectedMonth->format('n') === $this->current->format('n')) {
                $this->currentDays();
            } else {
                $this->calendar .= "\t\t" . '<td class="fade">' . $this->current->format("j") . '</td>' . "\n";
            }

            $this->current->modify("+1 day");
            $x += 1;
        }
        $this->calendar .= "\t</tr>\n";
    }

    protected function heading() {
        $this->monthlyChange = new DateTime($this->current->format("F j, Y"));
        $this->monthlyChange->modify("-1 month");
        $this->prev = $this->monthlyChange->format("Y-m-d");
        $this->monthlyChange->modify("+2 month");
        $this->next = $this->monthlyChange->format("Y-m-d");
        /* Create heading for the calendar */
        $this->calendar .= "\t<tr>\n";
        $this->calendar .= "\t\t" . '<th class="tableHeading" colspan="7">';
        $this->calendar .= '<a data-pos="prev" class="prev-left" href="' . $this->fileLocation() . $this->prev . '">Prev</a>';
        $this->calendar .= $this->current->format('F Y');
        $this->calendar .= '<a data-pos="next" class="next-right" href="' . $this->fileLocation()  . $this->next . '">Next</a>';
        $this->calendar .= "</th>\n";
        $this->calendar .= "\t</tr>\n";
    }

    protected function display() {
        $this->days = $this->current->format('t'); // Number of days in the month:
        /* Create the table */
        $this->calendar .= '<table class="calendar">' . "\n";
        $this->heading();
        /* Create days of the week heading (columns) */
        $this->calendar .= "\t<tr>\n";
        for ($x = 0; $x <= 6; $x++) {
            $this->calendar .= "\t\t<th>" . $this->alphaDay[$x] . "</th>\n";
        }
        $this->calendar .= "\t</tr>\n";

        /* Generate Actual Days of the Week */
        $this->current->modify("last sun of previous month");

        /*
         * Output 7 rows (49 days) guarantees an even calendar.
         */
        $num = 1;
        while ($num < 7) {
            $this->drawDays();
            $num += 1;
        }

        /* Close the HTML tags */
        return $this->calendar .= "</table>\n";
    }

    public function generateCalendar() {
        return $this->display();
    }

}
