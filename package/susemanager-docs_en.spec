#
# spec file for package susemanager-docs_en
#
# Copyright (c) 2015 SUSE LINUX GmbH, Nuernberg, Germany.
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


%bcond_without PDF
Name:           susemanager-docs_en
%define my_lang en
%define my_book susemanager-all
Version:        3.0
Release:        0
Provides:       locale(desktop-data-openSUSE:en)

Source:         doc-susemanager-develop.tar.bz2

BuildRequires:  daps
BuildRequires:  docbook5-xsl-stylesheets
BuildRequires:  fdupes
BuildRequires:  jing
BuildRequires:  suse-xsl-stylesheets >= 2.0.3
BuildRequires:  update-desktop-files
BuildRequires:  xerces-j2
BuildRequires:  java-1_8_0-ibm

BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch
Summary:        SUSE Manager Documentation (English)
License:        GFDL-1.2 or CC-BY-SA-3.0
Group:          Documentation/SUSE
Url:            http://doc.opensuse.org
%define _defaultdocdir %{_datadir}/doc/manual
%define _docdir %{_datadir}/doc/manual
%define jsp_root /srv/tomcat/webapps/rhn/help

%description
SUSE Manager 3 Documentation (English).

%package -n susemanager-getting-started_en-html
Summary:        SUSE Manager 3 Getting Started (English, HTML)
License:        GFDL-1.2 or CC-BY-SA-3.0
Group:          Documentation/SUSE
#Provides:    locale(desktop-data-openSUSE:en)

%description -n susemanager-getting-started_en-html
This will get you started with SUSE Manager 3

%prep
%setup -q -n doc-susemanager-develop

%build
%define my_all_dir  %{_builddir}/%{name}-%{version}/susemanager-all
daps -d DC-create-suma3-quickstart html

%install
mkdir -p %{buildroot}%{_docdir}
cp -a build/create-suma3-quickstart/html/book.suma3.quickstart.3 %{buildroot}%{_docdir}

%fdupes '%{buildroot}%{_docdir}'

%files -n susemanager-getting-started_en-html
%defattr(-,root,root)
%dir %{_docdir}
%doc %{_docdir}/book.suma3.quickstart.3

%changelog
