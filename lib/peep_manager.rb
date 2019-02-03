class Peepmanager

attr_reader :id, :peep, :time, :date 

  def intialize(id:, peep:, date:, time:)
    @id = id
    @peep = peep
    @date = date
    @time = time
  end
end
