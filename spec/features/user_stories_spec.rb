
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
feature '4. Post' do
  let(:user) { User.create(name: 'Ada Lovelace', user_name: 'Mech01001',email: 'adalove@gmail.com', password: 'LogicLove', password_confirmation: 'LogicLove') }

  scenario 'an user wants to post a message (peep) to chitter' do
    log_in(user_name: user.user_name, password: user.password)
    fill_in(:new_peep, with: 'This is my first peep!')
    click_button('Peep!')
    expect(page).to have_content('Ada Lovelace - @Mech01001 | This is my first peep!')
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature '5. Live feed' do
  let(:user) { User.create(name: 'Ada Lovelace', user_name: 'Mech01001',email: 'adalove@gmail.com', password: 'LogicLove', password_confirmation: 'LogicLove') }
  # let(:peep1) { Peep.create(content: "I'm peeping!", user_id: user.id, created_timedate: Time.now) }
  # let(:peep2) { Peep.create(content: "I'm peeping too!", user_id: user.id, created_timedate: Time.now) }

  scenario 'a user wants to see peeps in reverse chronological order' do
    sign_up
    fill_in(:new_peep, with: 'This is my first peep!')
    click_button('Peep!')
    fill_in(:new_peep, with: 'This is my second peep!')
    click_button('Peep!')
    expect(page).to have_selector("ul#peeps li:nth-child(1)", text: 'This is my second peep!')
    expect(page).to have_selector("ul#peeps li:nth-child(2)", text: 'This is my first peep!')
  end
end
# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
feature '6. Display time of peep' do
  let(:user) { User.create(name: 'Ada Lovelace', user_name: 'Mech01001',email: 'adalove@gmail.com', password: 'LogicLove', password_confirmation: 'LogicLove') }

  scenario 'an user wants to post a message (peep) to chitter' do
    log_in(user_name: user.user_name, password: user.password)
    fill_in(:new_peep, with: 'This is my second peep!')
    click_button('Peep!')
    expect(page).to have_content('Ada Lovelace - @Mech01001 | This is my first peep! | 04:46PM Sunday 29/01/2017')
  end
end
end
