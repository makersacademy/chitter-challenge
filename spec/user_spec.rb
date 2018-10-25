require './lib/user'

describe User do

  it 'has a handle' do
    @user = User.new
    expect(@user.handle('@winter_coming')).to eq '@winter_coming'
  end

end
