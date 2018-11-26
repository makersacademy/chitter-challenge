require 'user'
require 'pg'

describe '#sign_up' do
  context ' it allows a user to sign up to chitter' do
    subject = User.new
    expect(user.name).to eq "Wolverine"
  end
end
