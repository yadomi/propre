[![Gem Version](https://badge.fury.io/rb/propre.svg)](http://badge.fury.io/rb/propre)

Propre
======

##Introduction

**Propre** is a handy tool written in Ruby to bulk rename your movies using TheMovieDB API.

##Installation

    gem install propre

##Usage

    Usage: propre [OPTION]... SOURCE...
        -R, --recursive                  Run recursively
        -i, --interactive                Run interactively
        -V, --video-only                 Search for video files only
        -s, --sanitize                   Sanitize filename before search
        -d, --dotfile                    Don't ignore .dotfile

##Changelog

### 0.0.6

  - Fix: Resolving dependencies issues

### 0.0.5

  - Update directory structure to work with RubyGems

### 0.0.4

  - Add params to consider .dotfile
  - Add params to sanitize file before search
  - Bugfix

Disclaimer
----------

This tool was made on my spare time, i'm not responsable of any damages caused to your files