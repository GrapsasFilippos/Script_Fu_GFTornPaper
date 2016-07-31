#
# spec file for package Script_Fu_GFTornPaper
#
# Copyright (c) 2016 SUSE LINUX GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#


# See also http://en.opensuse.org/openSUSE:Specfile_guidelines

Name:           Script_Fu_GFTornPaper
Version:        0.1.0
Release:        1
Summary:        GIMP Script for Torn Out Paper filter

License:        GPLv3
Group:          Productivity/Graphics/Bitmap Editors
Url:            https://github.com/GrapsasFilippos/Script_Fu_GFTornPaper
Source0:        Script_Fu_GFTornPaper-0.1.0.tar.gz
# BuildRequires:  
Requires:       gimp
Requires:       php
BuildArch:      noarch
BuildRoot:      %{_tmppath}/%{name}-%{version}-build

%description


%prep
%setup -qn %{name}-%{version}


%install
make install DESTDIR=%{buildroot}

%files
%defattr(-,root,root,-)
/usr/bin/gimp-effect-GFTornPager
/usr/share/gimp/2.0/scripts/GFTornPaper.scm
/usr/share/gimp/2.0/scripts/GFTornPaperBatch.scm
