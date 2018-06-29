---
layout: page
title: Day 2
permalink: /day2/
---

## Synopsis

Today will feature an introduction to documentary editing, an introduction to the Text Encoding Initiative (TEI), and a demonstration of documentary editing with Senate House Library manuscripts.

## Aims

- Understand the difference between documentary editing and other forms of editing.
- General grasp of the Text Encoding Initiative and TEI schemas.
- Understanding of modelling texts.

## Schedule

### Day 2 (Tuesday, 3 July)

Time  | Topic                                                                  | Type
:---- | :--------------------------------------------------------------------- | :-----------------------
9.30  | Seminar 3: Documentary Editing; Introduction to the Text Encoding Initiative (TEI)                                        | Presentation, Discussion |
11.30 | Seminar 4: Text modelling; TEI and ODD | Presentation, discussion |
14.00 | Seminar 5: Building ODD for Documentary Editions: letters and journals | Digital lab              |
16.00 | Library Time                                                           | Presentation             |

#### Seminar 3

#### Readings

1. G. Thomas Tanselle, ["The Editing of Historical Documents."](/readings/tanselle_editing_historical _documents.pdf)
2. Lou Burnard's [*What is the TEI?*](https://books.openedition.org/oep/426)
3. James Cummings, ["The Text Encoding Initiative and the Study of Literature"](http://www.digitalhumanities.org/companion/view?docId=blackwell/9781405148641/9781405148641.xml&chunk.id=ss1-6-6&toc.depth=1&toc.id=ss1-6-6&brand=9781405148641_brand)
4. Elena Pierazzo, *Digital Scholarly Editing* (Chapter 2).

#### Documentary Editing
To make a long article short: transcribe as much as possible.

Yet: one cannot transcribe everything. As soon as transcription happens, an element of contingency comes into the text.

[Example 1: Mark Twain's notebooks and journals. Access slides here.](/Day2/mark-twain-journals.pdf)

[Example 2: Christopher Cranch's 1834 travel journal](http://scholarlyediting.org/2014/editions/cranchjournal.html)

#### Introduction to the Text Encoding Initiative (TEI)

[Access the TEI intro slides here.](/Day2/TEI-intro-slides.html)

#### Seminar 4

#### Text Modelling

"[E]very electronic representation of text is an interpretation" (Paul Eggert, *Securing the Past*, Cambridge UP, 2009).

And an argument, many say. Are these points obvious, or absurd?

Modelling: Our notions of modelling a text are really inherent in textual editing activities, but the theorising about modeling could point back to Willard McCarty's insistence on the centrality of modelling in digital humanities projects (see his *Humanities Computing*, Palgrave, 2005).

Patrick Sahle's model (of text modelling):

![Sahle_model](/day2/patrick_sahle_modelling.jpg)

(For the full slideshow, go to <http://dixit.uni-koeln.de/wp-content/uploads/2015/04/Camp1-Patrick_Sahle_-_Digital_Modelling.pdf>. And for his essay on the subject, click go to <https://www.openbookpublishers.com/htmlreader/978-1-78374-238-7/ch2.xhtml>.)

What do you think?

Sahle also provided a useful distinction of the 'digitised' versus the 'digital' edition. A work that is 'digitised' tends to mimic the codex––it is a page by page rendering. This form of digitisation is usually a PDF or even a hypertext marked up in html. But it is not interactive. A digital edition can only fully function in the digital realm––that is, if you have to print a digital edition, the edition would lose its functionality. The digital edition is more interactive  

What really distinguishes the two?

*Textons* versus *scriptons*: one of the distinguishing features of digital editing. A *texton* is all of the data that appears in the text file, while a *scripton* is the text as it appears to the user of the edition (see Pierazzo, Digital Scholarly Editing, p. 34). Put another way, it is raw source data versus the output that users see in the interface.

For example: in a recent documentary editing project on incoming letters to Mark Twain as part of an 1884 April Fools joke, each person is tagged with a pointer to a "personography" (a TEI file listing biographical information):

```
<text type="letter">
    <body>
      <pb facs="smith01.jpg" xml:id="pb0001" n="1"/>
      <head type="metadata">
        <name corresp="#JHS">J. Hyatt Smith</name> to <addressee>
          <name corresp="#SLC">Samuel L. Clemens</name>
        </addressee>
        <date when="1884-03-28">28 March 1884</date> &#8226; <name type="place">Brooklyn, N.Y.</name>
        <sourceline>(MS: CU-MARK, UCLC 41833)</sourceline>
      </head>
```

The #JHS and #SLC attributes point to @xml:id attributes in a separate personography file:

```
<person xml:id="JHS">
<persName type="display">Rev. J. Hyatt Smith</persName>
<persName type="full"><surname>Smith</surname>, <forename type="first">John</forename> <forename type="middle">Hyatt</forename></persName>
<birth when="1824">1824</birth>
<death when="1886">1886</death>
<sex>male</sex>
<note><p>Born in Saratoga, N.Y., John Hyatt Smith was educated by his schoolmaster father, then sent to Detroit to work as a clerk. There he was a close friend of Anson Burlingame, who later befriended Clemens in Hawaii. Smith studied for the ministry when he wasn't clerking. After ordination in 1848 he served as a Baptist minister in Poughkeepsie, Cleveland, Buffalo, and Philadelphia before he accepted a position at the Lee Avenue Church in Brooklyn. Smith ran as an independent Republican for a seat in the US House of Representatives and served from 1881 to 1883. In December 1883 he was called by a congregational council presided over by Edward Beecher (brother of Henry Ward Beecher) to fill a temporary pastorship at the East Congregational Church in Brooklyn, where he remained until his death.</p></note>
</person>
```
The biographical information is also rendered as a [network graph](http://scholarlyediting.org/2017/editions/aprilfools/graph/index.html).

Clearly these kinds of data could not be printed out, and even if one attempted to print all of the biographical information and the network connections, one would lose the interactivity between texts and individuals and their various connections.

#### TEI and ODD; TEI for Documentary Editing

Burnard: "How should you go about choosing just the parts of the TEI you need? How should you communicate the particular TEI encoding choices you have made to others so that such integration remains possible?"

Schema: the document's grammar. Say you want a rule: every poem should be a collection of `<l>` tags with `@n` (numbered line attributes), and that each group of `<l>`s should be grouped under an `<lg>` tag specifying that it is a numbered stanza (`@n` again) and a `@type` attribute for indicating the length of the stanza (e.g., couplet, tercet, quatrain, &amp;c.).

Or suppose in a documentary editing project, we are encoding letters, and we want to make sure each `<date>` tag has a `@when` attribute, or that each `<p>` has an `@xml:id` (a good idea), or that each `<persName>` has a `@ref` to point to the `@xml:id` of the person.

A schema will codify all of those rules such that the xml document will not be valid unless each line has an `@n` attribute.

There are three good ways to create schema for your project:

1. Relax ng schema (built into TEI files on oXygen).
2. Schematron.
3. ODD.

The TEI has elements such as `<schemaSpec>`, `<moduleRef>`, `<elementSpec>`, `<classSpec>` and others) combine formal XML declarations for inclusion in a DTD or Schema with detailed documentation and examples, for inclusion in a technical manual about the encoding scheme being specified. For this reason, a document using these elements is informally known as an ODD

ODD files (One Document Does it all) are TEI customisation files that serve as a source for the derivation of

* a formal TEI schema
* readable documentation of the project's TEI encoding choices

The TEI offers a web application called [Roma](http://www.tei-c.org/Roma/) to build ODDs.

The ODD validates the TEI document.  

### Seminar 5 (Senate House Library): Using TEI for documentary editions: letters and journals

TEI/ODD Exercise:

For more on customisation, read [Burnard](https://books.openedition.org/oep/692). We will also return to this topic on Day 4.
