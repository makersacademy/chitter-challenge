require './app/data_mapper_setup.rb'

module PeepHandler

  def peeps
    format_peeps(order_peeps(find_peeps))
  end

  def format_peeps(peeps_arr)
    peeps_arr.map do |peep|
      peep.time_string = peep.time.strftime("%b %e, %l:%M %p")
      peep
    end
  end

  def order_peeps(peeps_arr)
    peeps_arr.sort_by { |peep| peep.time }
  end

  def find_peeps(peep_class = Peep)
    peep_class.all
  end

  def create_peep(peep, user)
    Peep.create(content: peep, time: Time.now, user_id: user.id)
  end

end
