[![Gem Version](https://badge.fury.io/rb/propre.svg)](http://badge.fury.io/rb/propre)

Propre
======

![Propre](http://cl.ly/image/3b3M2Q2s2r2r/Image%202014-12-31%20at%204.10.46%20PM.png)

##Introduction

**Propre** is a handy tool written in Ruby to bulk rename your movies.

Propre will extract the title of a movie from it's filename and then rename it by removing any useless part.

##Installation

    gem install propre

##Usage

  Commands:
    propre --version, -v        # Show version information about this program and quit.
    propre help [COMMAND]       # Describe available commands or one specific command
    propre lint [FILENAME...]   # Sanitize the specified file. Use --dry for dry run
    propre metadata [FILENAME]  # Show metadata about the specified movie or episode

##Changelog

### 0.2.0

  - Complete rewrite with Thor
  - Removing the use of TMDB since search result wasn't successful

### 0.1.1

  - Fix bug when no movie was found
  - Fix wording

### 0.1.0

  - The first result is now the best match in the list (using similar_text)
  - Results are now ordered by release date
  - Extensions are now in lowercase when renaming (.AVI,.Avi -> .avi)

Disclaimer
----------

This tool was made on my spare time, i'm not responsable of any damages caused to your files
