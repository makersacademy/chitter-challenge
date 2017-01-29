
describe 'User Stories: Chitter' do

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature '1. Sign up' do
  scenario 'a new user wants to sign up' do
    sign_up
    expect(page).to have_content('Welcome Enrico Fermi @atom1901!')
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
feature '2. Log In' do
  let(:user) { User.create(name: 'Ada Lovelace', user_name: 'Mech01001',email: 'adalove@gmail.com', password: 'LogicLove', password_confirmation: 'LogicLove') }

  scenario 'an existing user wants to log in' do
    log_in(user_name: user.user_name, password: user.password)
    expect(page).to have_content('Welcome Ada Lovelace @Mech01001!')
  end
end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
feature '3. Log Out' do
  let(:user) { User.create(name: 'Ada Lovelace', user_name: 'Mech01001',email: 'adalove@gmail.com', password: 'LogicLove', password_confirmation: 'LogicLove') }

  scenario 'an existing user wants to log out' do
    log_in(user_name: user.user_name, password: user.password)
    log_out
    expect(page).to_not have_content('Welcome Ada Lovelace @Mech01001!')
  end
end
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#
# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

end
