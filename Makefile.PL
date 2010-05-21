# Copyright (C) 2010 Wes Hardaker
# License: GNU GPLv2
#!/usr/bin/perl

use ExtUtils::MakeMaker;

%opts = (
	 'NAME'		=> 'httpsum',
	 'PREREQ_PM'    => { XML::Simple => 0,
			     Getopt::GUI::Long => 0,
			     Parse::AccessLogEntry => 0
			   },
	 'EXE_FILES' => [qw(httpsum)],
	);

if (!($^O eq 'MSWin32' || $Config{'ccflags'} =~ /-D_?WIN32_?/)) {
    # doesn't work on windows: no sed
    $opts{'PM_FILTER'} = 'sed -e "s|/usr/share|$(PREFIX)/share|"';
}

WriteMakefile(%opts);

sub MY::postamble {
    return '

SUMINSTALLDIR=$(PREFIX)
DATADIR=$(SUMINSTALLDIR)/share/httpsum/
MODULEDIR=$(DATADIR)/include-modules

INSTALL=$(PERL) "-MExtUtils::Command" -e cp

install:: httpsumdata

httpsumdata:
	$(MKPATH) $(MODULEDIR)
	$(INSTALL) data/*.xml $(DATADIR)/include-modules

';
}

