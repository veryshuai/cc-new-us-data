* this file reads the NBER family files and saves them as one merged STATA file. 
* notice: unzipped NBER files should manually be added a ".0" extension (e.g. ffile021.0).
* nber3.dct is used as a dictionary.

cd "/home/veryshuai/Documents/cc/new_us_data/nber/combined/"
set more 1
# delimit;
quietly {;
clear;
set mem 200m;

*====================================;
local yrstart=1986; local yrend=2003; // notice: since 2004:3 and 2004:4 are missing, i only take q3 and q4 from 2003, and q1 and q2 from 2004.
*====================================;

local yr=`yrstart'; while `yr'<=`yrend' {;
  local str_yr=substr(string(`yr'),3,2);
  local q=1; while `q'<=4 {;
	if ~( (`yr'==2003 & (`q'==3 | `q'==4)) | (`yr'==1985 & (`q'==3 | `q'==4)) | (`yr'==1995 & (`q'==3 | `q'==4)) | (`yr'==1998 & (`q'==3 | `q'==4))) {;
		drop _all;
		infile using nber3.dct, using ("../unzipped/ffile`str_yr'`q'.0");
		gen yearq=`yr'`q'; gen yr=`yr'; *gen q=`q';
		save ".ffile`str_yr'`q'", replace;
	};
    local ++q;
  };
  local ++yr;
};
}; /* quietly */

* merge all files;
drop if 1==1; * drop all obs of the file in memory, to prevent duplicate records.;
count;
local yr=`yrstart'; while `yr'<=`yrend' {;
  local str_yr=substr(string(`yr'),3,2);
  local q=1; while `q'<=4 {;
	if ~( (`yr'==2003 & (`q'==3 | `q'==4)) | (`yr'==1985 & (`q'==3 | `q'==4)) | (`yr'==1995 & (`q'==3 | `q'==4)) | (`yr'==1998 & (`q'==3 | `q'==4))) ///
			append using ".ffile`str_yr'`q'";
    count;
    local ++q;
  };
  local ++yr;
};
local str_save = substr(string(`yrstart'),3,2)+substr(string(`yrend'),3,2);
save ffile`str_save', replace; 
