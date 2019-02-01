require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :created_at, DateTime

  def self.all_peeps
    all.map { |peep| new(id: peep[:id], content: peep[:content], created_at: peep[:created_at]) }
  end

  def self.print_peeps(printer = Printer)
    printer.new.print_out_peeps(all_peeps)
  end

  def initialzie(id:, content:, created_at:)
    @id = id
    @content = content
    @created_at = created_at
  end
end
