require_relative 'lorem_ipsum/text'
require_relative 'lorem_ipsum/character'
require_relative 'lorem_ipsum/paragraph'
require_relative 'lorem_ipsum/word'
require_relative 'lorem_ipsum/base'

require 'pry'

LoremIpsum = LoremIpsumAmet::Base.new

require_relative 'lorem_ipsum/rails/railtie' if defined?(Rails::Railtie)

