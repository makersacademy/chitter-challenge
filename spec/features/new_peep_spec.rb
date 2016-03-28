require 'pry'
feature 'new peep' do

  let(:user) do
    User.create(name: 'user',
                email: 'user@example.com',
                username: 'sachinkaria',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'peep table exists' do
    expect{user.peeps.create(message: "This is the first peep")}.to change{Peep.count}.by(1)
  end

  scenario 'creates a new peep' do
    sign_in(username: user.username,   password: user.password)
    expect{new_peep}.to change{Peep.count}.by(1)
  end
end