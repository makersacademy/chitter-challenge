
describe Chitter_user do
  let(:user) do
    Chitter_user.create(name: 'Richard', username: 'richard_thompson',
                email: 'richardthompson@cmail.com', password: '1234567',
                password_confirmation: '1234567')
  end
