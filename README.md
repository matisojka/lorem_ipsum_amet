# Lorem Ipsum Amet - blind text && placeholder generator
===========

[![Build Status](https://secure.travis-ci.org/yagooar/lorem_ipsum_amet.png)](http://travis-ci.org/yagooar/lorem_ipsum_amet)


**Lorem Ipsum Amet** is a gem that provides a simple yet powerful DSL for generating blind texts and placeholder images. You can use it in your **Ruby** or **Ruby on Rails** projects or in as a command line tool with the provided executable.

Lots of shortcuts have been incorporated in order to make the DSL concise yet expressive to avoid lots of typing.

## Installation

### With Gemfile

Add it to your Gemfile:

    gem 'lorem_ipsum_amet'

And run:

    bundle install

to install it.

#### Without Gemfile

In the command line:

    gem install lorem_ipsum_amet

And then require it in your project:

    require 'lorem_ipsum_amet'

#### Command line tool

The command line tool is installed by default following the above steps.

## Usage

The gem provides all of its features through the namespace LoremIpsum. If you are using it in a **Rails** project, refer to the next section.

### Quick and dirty!

#### Text

    LoremIpsum.lorem_ipsum

or (alternatively)

    LoremIpsum.text

### Random text beginning

    LoremIpsum.random
    LoremIpsum.random(paragraphs: 4)

#### Rails (ERB)

    <%= lorem_ipsum(300) %>

#### Placeholder image

    LoremIpsum.placeholder_image(300, 200)

#### Rails (HAML)

    = image_tag placeholder_image(200)

#### Command line

    lorem_ipsum --paragraphs 4
    lorem_ipsum -r 2 # two random paragraphs


### More Examples

#### Characters

Get 100 characters:

    LoremIpsum.lorem_ipsum(100)

    LoremIpsum.lorem_ipsum(characters: 100)

    LoremIpsum.lorem_ipsum(c: 100)

    LoremIpsum.c(100)

#### Paragraph

Get 3 paragraphs:

    LoremIpsum.lorem_ipsum(paragraphs: 3)

    LoremIpsum.lorem_ipsum(p: 3)

    LoremIpsum.p(3)

#### Words

Get 200 words:

    LoremIpsum.lorem_ipsum(words: 200)

    LoremIpsum.lorem_ipsum(w: 200)

    LoremIpsum.w(200)

#### HTML

Get 5 paragraphs with `<br />` breaks instead of `\n`:

    LoremIpsum.lorem_ipsum(paragraphs: 5, html: true)

#### Custom paragraph join

Get 3 paragraphs joined by \r\n:

    LoremIpsum.lorem_ipsum(paragraphs: 3, join: "\r\n")

#### Text formatting

Use the format parameter.

Title case:

    LoremIpsum.lorem_ipsum(10, format: :title_case)

Upcase:

    LoremIpsum.lorem_ipsum(10, format: :upcase)

Downcase:

    LoremIpsum.lorem_ipsum(10, format: :downcase)

#### Different text lengths

There are also some shortcuts for getting different text lengths.

Short:

    LoremIpsum.short

Medium:

    LoremIpsum.medium
    LoremIpsum.medium("<br />")

Long:

    LoremIpsum.long
    LoremIpsum.long("<br />")

Very long:

    LoremIpsum.very_long
    LoremIpsum.very_long("<br />")

### Rails integration

If you are using this gem in a Rails project, you can access the following helper methods to get exactly the same functionality as described in the examples before.

The html option for the text helper is activated by default.

ERB:

    <%= text_area_tag 'placeholder', lorem_ipsum %>
    <%= image_tag placeholder_image(300) %>

HAML:

    %p= lorem_ipsum(paragraphs: 5)
    %p= image_tag placeholder_image(200, 100)

#### Command line tool

The command line tool offers a thin wrapper over most of the text features.

    lorem_ipsum --characters 100
    lorem_ipsum -p 5 -j '<br />'
    lorem_ipsum --words 10 --format upcase

    Usage: lorem_ipsum [options]
        -c, --characters [NUMBER]        Amount of characters
        -p, --paragraphs [NUMBER]        Amount of paragraphs
        -w, --words [NUMBER]             Amount of words
        -j, --join [ELEMENT]             Custom join element
        -f, --format [FORMAT]            Text format (titlecase, upcase, downcase)
        -r, --random [NUMBER]            Amount of paragraphs with random beginning
        -h, --help                       Display this screen


## Bug reports and contributions

If you discover any bugs or need a feature, feel free to create an issue on GitHub. I also encourage you to help even more by forking and sending a pull request.

## Maintainers

* Mateusz Sójka (https://github.com/yagooar)

## License

MIT License. Refer to [License file](https://github.com/yagooar/lorem_ipsum_amet/blob/master/LICENSE.txt)

