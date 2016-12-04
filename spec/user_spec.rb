require_relative '../app/models/user.rb'

describe User do

  it 'increases user count with new sign ups' do
    expect{User.new({})}.to change{User.user_count}.by 1
  end

end
