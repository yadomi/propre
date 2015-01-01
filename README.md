[![Gem Version](https://badge.fury.io/rb/propre.svg)](http://badge.fury.io/rb/propre)

Propre
======

![Propre](http://cl.ly/image/3b3M2Q2s2r2r/Image%202014-12-31%20at%204.10.46%20PM.png)

##Introduction

**Propre** is a handy tool written in Ruby to bulk rename your movies using [TheMovieDB](https://www.themoviedb.org/) API.

##Installation

    gem install propre

To use Propre, you need an API Key from TheMovieDB. Get your API key [here](https://www.themoviedb.org/account).

##Usage

    Usage: propre [OPTION]... SOURCE...
        -i, --interactive                Run interactively
        -R, --recursive                  Run recursively
        -V, --video-only                 Search for video files only
        -s, --sanitize                   Sanitize filename before search
        -d, --dotfile                    Don't ignore .dotfile
        -v, --version                    Show version information about this program and quit.
        -h, --help, --usage              Show this help message and quit.

##Changelog

### 0.0.8

  - Add version and usage params
  - Fix: Create config directory if not present
  - Fix: Wording
  - Better errors handling

### 0.0.7

  - Fix: Sanitize params now work

Disclaimer
----------

This tool was made on my spare time, i'm not responsable of any damages caused to your files
