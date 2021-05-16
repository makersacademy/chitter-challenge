class Peep

  attr_reader :id, :user_id, :text, :date, :name, :picture, :username

  def initialize(result_hash)
    @id = result_hash[:id].to_i
    @user_id = result_hash[:user_id].to_i
    @text = result_hash[:text]
    @date = result_hash[:date]
    @name = result_hash[:name]
    @username = result_hash[:username]
    @picture = result_hash[:picture]
  end

end
