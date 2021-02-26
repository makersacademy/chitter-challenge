class Peep

  attr_reader :id, :user_id, :text, :date, :name, :picture

  def initialize(result_hash)
    @id = result_hash[:id].to_i
    @user_id = result_hash[:user_id].to_i
    @text = result_hash[:text]
    @date = result_hash[:date]
    @name = result_hash[:name]
    @picture = result_hash[:picture]
  end

end