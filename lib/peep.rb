require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :created_at, DateTime


  def self.print_peeps(printer = Printer)
    printer.new.print_out_peeps(all)
  end

end
