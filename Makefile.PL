# Copyright (C) 2010 Wes Hardaker
# License: GNU GPLv2
#!/usr/bin/perl

use ExtUtils::MakeMaker;

%opts = (
	 'NAME'		=> 'httpsum',
	 'PREREQ_PM'    => { XML::Simple => 0,
			     Getopt::GUI::Long => 0
			     Parse::AccessLogEntry => 0
			   },
	 'EXE_FILES' => [qw(httpsum)],
	);

WriteMakefile(%opts);
