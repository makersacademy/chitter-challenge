
class Peep
  include DataMapper::Resource

  property(:id, Serial)
  property(:body, String)



  def reverse_peep_order
    Peeps.all.reverse
  end

end
