class Peep
attr_reader :body, :time

  def self.all
    @peeps = [["First test peep", Time.new(2000)], ["Second test peep", Time.new(2003)], ["Third test peep", Time.new(2004)]]
    @peeps.reverse!
  end

  def self.create(body:,time: Time.now)
     @body = body
     @time = time
     peep = [@body, @time]
     @peeps << peep
     @peeps.reverse!
  end

end
