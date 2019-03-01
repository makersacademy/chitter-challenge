class Peep

  attr_reader :name, :handle, :peep_text, :peep_time
  @all_peeps = []
  def self.create_peep(name,handle,peep_text)
    @all_peeps << Peep.new(name,handle,peep_text)
  end

  def self.all
    @all_peeps
  end


  def initialize(name,handle,peep_text)
    @name = name
    @handle = handle
    @peep_text = peep_text
    @peep_time = Time.now.strftime("%R")
  end

end