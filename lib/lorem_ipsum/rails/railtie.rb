require_relative 'view_helpers'

module LoremIpsumAmet
  class Railtie < Rails::Railtie

    initializer 'lorem_ipsum_amet.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end

  end
end

