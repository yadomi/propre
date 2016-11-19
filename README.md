Propre
======

[![Gem Version](https://badge.fury.io/rb/propre.svg)](https://rubygems.org/gems/propre/)
[![Dependency Status](https://gemnasium.com/yadomi/propre.svg)](https://gemnasium.com/yadomi/propre)
[![Gem](https://img.shields.io/gem/dtv/propre.svg)](https://rubygems.org/gems/propre/)

---

![Propre](http://cl.ly/image/3b3M2Q2s2r2r/Image%202014-12-31%20at%204.10.46%20PM.png)

##Introduction

**Propre** is a handy tool written in Ruby to bulk rename your movies.

Propre will extract the title of a movie from it's filename and then rename it by removing any useless part. See demo [here](http://yadomi.github.io/propre/).

##Installation

    gem install propre

##Usage

    Commands:
      propre --version, -v        # Show version information about this program and quit.
      propre help [COMMAND]       # Describe available commands or one specific command
      propre lint [FILENAME...]   # Sanitize the specified file. Use --dry for dry run
      propre metadata [FILENAME]  # Show metadata about the specified movie or episode

##Changelog

### 0.3.4
  - Update dictionnary ([#17](https://github.com/yadomi/propre/issues/17))
  - Remove words in brackets ([#17](https://github.com/yadomi/propre/issues/17))

### 0.3.3
  - Update blacklist ([#16](https://github.com/yadomi/propre/issues/16))

### 0.3.2
  - Fix working directory issue when renaming with path ([#13](https://github.com/yadomi/propre/issues/13))

### 0.3.1

  - Added Rubocop
  - Dynamically find words seperator by counting the more redundant char
  - Update blacklist

### 0.3.0

  - Extract quality as metadata
  - Extract language as metadata
  - Update blacklist

### 0.2.2

  - Update blacklist (added fastsub)

### 0.2.1

  - Update blacklist (added x264, french)

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
