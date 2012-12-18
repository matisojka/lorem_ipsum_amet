require_relative 'lorem_ipsum_amet/text'
require_relative 'lorem_ipsum_amet/character'
require_relative 'lorem_ipsum_amet/paragraph'
require_relative 'lorem_ipsum_amet/word'
require_relative 'lorem_ipsum_amet/image'
require_relative 'lorem_ipsum_amet/base'

LoremIpsum = LoremIpsumAmet::Base.new

require_relative 'lorem_ipsum_amet/rails/railtie' if defined?(Rails::Railtie)

