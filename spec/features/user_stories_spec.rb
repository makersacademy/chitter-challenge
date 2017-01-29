
describe 'User Stories: Chitter' do

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature '1. Sign up' do
  scenario 'a new user wants to sign up' do
    sign_up
    expect(page).to have_content('Welcome Enrico Fermi @atom1901!')
  end

  scenario 'a new user won\'t be able to sign up if the user name is not available' do
    sign_up
    visit '/'
    click_button('New User')
    fill_in(:name, with: 'Luigi Fermi')
    fill_in(:user_name, with: 'atom1901')
    fill_in(:email, with: 'luis@gmail.com')
    fill_in(:password, with: 'littleBrother')
    fill_in(:password_confirmation, with: 'littleBrother')
    click_button('Sign Up')
    expect(page).to have_content('User name is already taken')
  end

  scenario 'a new user won\'t be able to sign up if email already taken' do
    sign_up
    visit '/'
    click_button('New User')
    fill_in(:name, with: 'Luigi Fermi')
    fill_in(:user_name, with: 'LuisAtom')
    fill_in(:email, with: 'efermi@gmail.com')
    fill_in(:password, with: 'littleBrother')
    fill_in(:password_confirmation, with: 'littleBrother')
    click_button('Sign Up')
    expect(page).to have_content('Email is already taken')
  end

  scenario 'a new user won\'t be able to sign up if password confirmation doesn\'t match password' do
    sign_up
    visit '/'
    click_button('New User')
    fill_in(:name, with: 'Luigi Fermi')
    fill_in(:user_name, with: 'LuisAtom')
    fill_in(:email, with: 'luis@gmail.com')
    fill_in(:password, with: 'littleBrother')
    fill_in(:password_confirmation, with: 'littleBother')
    click_button('Sign Up')
    expect(page).to have_content('Password does not match the confirmation')
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

  scenario 'an new user cannot log in (must sign up)' do
    log_in(user_name: 'Marie', password: 'curie')
    expect(page).to have_content('Incorrect nickname or password. Try again.')
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

  scenario 'an user wants to see the time at which a peep was made' do
    peep = Peep.create(content: "I'm peeping!", user_id: user.id, created_timedate: Time.new(2017, 01, 29, 18, 53))
    visit '/'
    expect(page).to have_content("Ada Lovelace - @Mech01001 | I'm peeping! | 06:53PM Sunday 29/01/2017")
  end
end
end
