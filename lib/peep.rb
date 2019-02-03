require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :created_at, DateTime

  belongs_to :user, required: false


  def self.print_peeps(printer = Printer)
    printer.new.print_out_peeps(all)
  end

  def self.check_tags(peep, user = User)
    content = peep.content
    tags = content.split(" ").select{|word| word[0] == '@'}
    user.check_user(tags: tags, content: content) if tags.length > 0
  end

end
