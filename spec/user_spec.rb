require './spec/factories/user'

describe User do
  it 'authenticates when given a valid username and password' do
    user = create :user
    expect(User.authenticate(user.username, user.password)).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    user = create :user
    expect(User.authenticate(user.username, 'wrong_password')).to be_nil
  end
end

# describe User do
#   it 'responds to create_peep with 1 argument' do
#     expect(subject).to respond_to(:create_peep).with(1).argument
#   end
#
#   it 'creates a new peep when create_peep is called' do
#     expect(Peep).to receive(:create).with(content: :content)
#     subject.create_peep :content
#   end
# end
