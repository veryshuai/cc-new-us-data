*This script trims the stata data for use in estimation routine

clear

use consp_processed

keep exptot fc1 fc2 fc3 fc4 fc5 fc6 fc7 fc8 fc9 fc10 fc11 fc12 fc13 fc14 fc15 fc16 fc17 fc18 fc19 fc20 fc21 fc22 fc23 fc24 fc25 fc26 fc27 fc28 fc29 fc30 fc31

saveold exp_dat, replace
