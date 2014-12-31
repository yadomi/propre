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