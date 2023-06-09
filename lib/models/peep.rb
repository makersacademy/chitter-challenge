class Peep
  attr_accessor :id, :content, :timestamp, :user_id

  def author
    UserRepository.find(user_id)
  end

  def tags
    PeepTagRepository.find_by_peep(id)
  end
end