require_relative 'lorem_ipsum/text'
require_relative 'lorem_ipsum/character'
require_relative 'lorem_ipsum/base'

require 'pry'

class LoremIpsum < LoremIpsumAmet::Base; end

require_relative 'lorem_ipsum/rails/railtie' if defined?(Rails::Railtie)

