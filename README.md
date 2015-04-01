Presentation build system
=========================


Description
-----------

This is what I use to build my slides. I have the following goals:

* Easy to write
* Easy to change/copy-paste
* Automated formatting of images
* Automated rebuild when something changes
* Ability to write the text of the talk in the presentation
* Ability to extract the text of the presentation as a blog post
* Ability to easily track changes with a version control system

For example on how to use, see ``example.pandoc``.

Usage
-----

* Write your presentation as *something*.pandoc
* Put your .png images in ``img/``
* Run ``make``
* Lather, rinse, repeat

Requirements
------------

* Make
* php (for building the text)
* imagemagick (image manipulation)
* pandoc (duh)
* texlive-lang-cyrillic if you want to write in Cyrillic
* git (if you want to put this in a version control system, which I highly recommend)

This all was tested/developed on Debian.

Missing features
----------------

* Multiple images on one page
    * This is not supported by pandoc in anyway, you'll need LaTeX for that
* Support for other images than png
    * Too lazy to add it

