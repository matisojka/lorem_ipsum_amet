require 'open-uri'
require 'tempfile'
require 'dimensions'

def download_file(url)
  file = Tempfile.new('file')
  open(url) { |stream| file.write stream.read }

  file.close
  file.path
end

class SpecImage

  def initialize(path)
    @path = path
  end

  def width
    Dimensions.width(@path)
  end

  def height
    Dimensions.height(@path)
  end

end

