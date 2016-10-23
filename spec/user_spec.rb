require_relative '../app/models/user'

describe User do
  it 'adds a record' do
    user = User.new
    user.email = 'maker@makers.com'
    user.save!
    expect(User.count).to eq(1)
  end
end
