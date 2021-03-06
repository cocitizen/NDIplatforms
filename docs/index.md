NDI PLATFORMS [![Build status](https://travis-ci.org/nditech/NDIplatforms.svg)](https://travis-ci.org/nditech/NDIplatforms)
=============

NDIplatforms is a set of [Drush
makefiles](http://www.drush.org/en/master/make/) structured for easy
maintenance. It is used, along with the [Aegir Hosting
System](http://aegirproject.org), to maintain [NDI](https://www.ndi.org/)'s
[DemTools](https://dem.tools) mass-hosting platform, DemCloud.

Normal usage of NDIplatforms involves simply running Drush Make with one of the
supplied "lock" files. Lockfiles are simply makefiles with all versions
completely specified. Further instructions can be found on the
[Usage](usage.md) section.

NDIplatforms uses a particular directory layout to make maintaining makefiles
easier. For a discussion on the reasoning behind this, see the
[Structure](structure.md) section.

The maintenance of NDIplatforms leverages a number of features that are new to
Drush 8. See the [Install](install.md) section for a detailed walk-through of
installing NDIplatforms and its dependencies.

A specific workflow was developed to maintain the "lock" files. This workflow
is described in the [Maintenance](maintenance.md) section.

This documentation is managed with [mkdocs](http://www.mkdocs.org/). For
information on getting started, see the [Documentation](documentation.md)
section.

