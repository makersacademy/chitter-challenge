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
    tags = has_tags?(content)
    user.check_user(tags: tags, content: content) if tags
  end

  def self.has_tags?(content)
    tags = content.split(" ").select{ |word| word[0] == '@' }
    tags.length > 0 ? tags : nil
  end

  private_class_method :has_tags?

end
