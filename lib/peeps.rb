class Peep
  attr_reader :id, :content, :user_id

  def initialize(options)
    @id = options[:id]
    @content = options[:content]
    @user_id = options[:user_id]
  end
end

