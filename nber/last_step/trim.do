*This script trims the stata data for use in estimation routine

clear

use consp_processed

* Create age and region aggreagates 
g up40 = 0
replace up40 = 1 if age >= 40
g be40 = 0
replace be40 = 1 if age < 40
g ne = 0
replace ne = 1 if region == 1
g mw = 0
replace mw = 1 if region == 2
g st = 0
replace st = 1 if region == 3
g wt = 0
replace wt = 1 if region == 4


keep exptot fc1 fc2 fc3 fc4 fc5 fc6 fc7 fc8 fc9 fc10 fc11 fc12 fc13 fc14 fc15 fc16 fc17 fc18 fc19 fc20 fc21 fc22 fc23 fc24 fc25 fc26 fc27 fc28 fc29 up40 be40 ne mw st wt

saveold exp_dat, replace
