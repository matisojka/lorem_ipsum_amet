# Lorem Ipsum Amet - blind text generator
===========

**Lorem Ipsum Amet** is a gem that provides a simple yet powerful DSL for generating blind texts in your Ruby or Ruby on Rails projects.

## Installation

Add it to your Gemfile:

    gem 'lorem-ipsum-amet'

And run:

    bundle install

to install it.

## Usage

The gem provides all of its features through the namespace LoremIpsum. If you are using it in a Rails project, refer to the next section.

### Examples

#### Get some lorem ipsum!

    LoremIpsum.lorem_ipsum

or (alternatively)

    LoremIpsum.text

#### Characters

Get 100 characters:

    LoremIpsum.lorem_ipsum(100)

    LoremIpsum.lorem_ipsum(characters: 100)

    LoremIpsum.c(100)

#### Paragraph

Get 3 paragraphs:

    LoremIpsum.lorem_ipsum(paragraphs: 3)

    LoremIpsum.c(3)

#### Words

Get 200 words:

    LoremIpsum.lorem_ipsum(words: 3)

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

If you are using this gem in a Rails project, you can access the helper method lorem_ipsum to get exactly the same functionality as described in the examples before.

The html option is activated by default.

ERB:

    <%= text_area_tag 'placeholder', lorem_ipsum %>

HAML:

    %p= lorem_ipsum(paragraphs: 5)

## Bug reports and contributions

If you discover any bugs or need a feature, feel free to create an issue on GitHub. I also encourage you to help even more by forking and sending a pull request.

## Maintainers

* Mateusz Sójka (https://github.com/yagooar)

## License

MIT License. Refer to [License file](https://github.com/yagooar/lorem_ipsum_amet/blob/master/LICENSE.txt)

