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
    tags = tags?(peep.content)
    user.check_users(tags: tags, peep: peep) if tags
  end

  def self.tags?(content)
    tags = content.split(" ").select { |word| word[0] == '@' }.map { |tag| tag[1..-1] }
    tags.length.positive? ? tags : nil
  end

  private_class_method :tags?

end
