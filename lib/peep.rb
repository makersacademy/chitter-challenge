class Peep
  attr_reader :name, :content, :timestamp, :peeps_list

  def initialize(name, content)
    @name = name
    @content = content
    @peeps_list = []
  end

  def create
    @peeps_list.push({ name: name, content: content })
  end
end
