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

end
