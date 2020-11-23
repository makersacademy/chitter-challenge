class Peep

  attr_reader :content, :author

  def initialize(content)
    # @author = author
    @content = content
  end


  def self.all
    result = PG.connect(dbname: 'chitter').exec("SELECT * FROM peeps;")
    result.map do |peep|
    Peep.new(author: peep['author'], content: peep['content'])
  end
  end

end
