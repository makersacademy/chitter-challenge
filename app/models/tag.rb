require 'data_mapper'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  has n, :peeps, through: Resource

  def to_html
    "<a class=\"tag\" href=\"/tags/#{@id}\">##{@name}</a>"
  end
end
