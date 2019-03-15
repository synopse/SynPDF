SynPDF
======

Synopse PDF engine is a fully featured *Open Source* PDF document creation library for Delphi and FPC, embedded in one unit.

It's used e.g. in our [*mORMot* framework](https://github.com/synopse/mORMot), for creating PDF files from generated reports. 
But you can use it stand-alone, without our main ORM/SOA framework.

If you download the whole *mORMot* source code, you do not need this separate package: ensure you get rid of any existing separated *SynPDF* installation, and use the PDF units as available in the main *mORMot* trunk.
This *SynPDF* distribution/GitHub account targets only people needing PDF writing, without other *mORMot* features, under Delphi (some files may be missing for FPC).

If you plan using any part of the framework (e.g. *SynLog*, *SynDB* or the *ORM*/*SOA*), don't use this repository, but use the main [*mORMot* framework](https://github.com/synopse/mORMot). Having the two repositories on the same environement may be a source of unexpected version conflict. Just use and trust the main *mORMot* repository, which will be updated much more often.

Features
--------

  * Pure Delphi code, with no external .dll, and adding very small code size to your executable;
  * Targets Delphi 5 up to Delphi 10.3 Rio (and latest version of FPC), for Win32 and Win64 platforms, with full source code provided;
  * Includes most vectorial drawing commands, including text,lines or curves;
  * Renders bitmaps, and metafiles (even most .emf files with clipping and regioning);
  * Introduce metadata, bookmarks and outline information;
  * Produce very small .pdf files;
  * Optionally [encrypt and secure the .pdf content](http://blog.synopse.info/post/2013/06/19/SynPDF-now-implements-40-bit-and-128-bit-security) using 40 bit or 128 bit keys;
  * Fast file generation with low memory overhead (tested with several thousands of pages);
  * Access a true VCL TCanvas instance to create the PDF content;
  * Optionally embed True Type fonts subsets;
  * Unicode ready, even with pre-Unicode versions of Delphi, including advanced [Uniscribe Glyph shading and Font fallback](http://blog.synopse.info/tag/Uniscribe);
  * Can publish PDF/A-1 archive files;
  * Used in a lot of applications, with regular enhancements, mainly from active end-users;
  * Licensed under a [MPL/GPL/LGPL tri-license](https://synopse.info/forum/viewtopic.php?id=27).

Sample Code
-----------

In fact, you have at least three ways of generating pdfs using the library:
  * [Directly call](https://synopse.info/forum/viewtopic.php?pid=370#p370) of a `TPdfCanvas` as published by a `TPdfDocument` instance - this is the most direct but also more difficult way of rendering;
  * [Use regular VCL `TCanvas` methods](https://synopse.info/forum/viewtopic.php?pid=1909#p1909) thanks to `TMetaFile` support - see `TPdfDocumentGDI.VCLCanvas` property and the `TPdfCanvas.RenderMetaFile` method - this is very easy if you want to use "regular" `TCanvas` methods to draw the page content, especially if you have some existing printing code;
  * [Use `TGDIPages` of the supplied `mORMotReport.pas` unit](http://blog.synopse.info/post/2010/06/30/Making-report-from-code) (extracted from our *mORMot* ORM/SOA framework) to easily create the content from code, with some report-oriented methods (including complex rtf with `TGDIPages.AppendRichEdit`) - for basic reporting features, it is pretty much the solution.

The 2nd and 3rd ways are preferred, for most applications.

Relevant Forks
--------------

Some users did fork the project, and add some nice features, useful for some particular needs, but which were not merged yet to ease maintenance and ensure backward compatibility.

  * EvaF made a [texture-based fork](https://github.com/Eva-F/SynPDF/tree/Eva-F-texture-pattern) - see [this forum thread](https://synopse.info/forum/viewtopic.php?id=4932) and [the documents sub-folder](https://github.com/Eva-F/SynPDF/tree/Eva-F-texture-pattern/documents).

Documentation
-------------

For detailed documentation of the unit, see the corresponding pages in the "[Software Architecture Document](https://synopse.info/fossil/wiki?name=Downloads)" of *mORMot* official documentation, or directly in the interface part of the unit, as methods comments. 

Including the report generation pages within the "*SynFile Main Demo*" description.

Dedicated Blog and Forum
------------------------

A blog is available at http://blog.synopse.info, and will notify any evolution of this component.

A forum is dedicated to this component, and is available on [https://synopse.info](https://synopse.info/forum/viewforum.php?id=1)

This is the main entry point for support: first search for an existing answer, then ask your question in a new thread.

