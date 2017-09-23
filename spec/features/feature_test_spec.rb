# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Can view a message (peep) on Chitter' do
  scenario 'a user wants to view a message' do
    Peep.create(message: 'Hello world!')
    visit '/peeps'
    expect(page).to have_content 'Hello world!'
  end
end

feature 'Can create a new message (peep) on Chitter' do
  scenario 'creating a new peep' do
    visit '/peeps/new'
    fill_in 'message',   with: 'Hello world!'
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Hello world!')
    end
  end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Can view all peeps in reverse chronological order' do
  scenario 'User adds 2 peeps then wants to view them' do
      Peep.create(message: 'Hello world!')
      Peep.create(message: 'Just chillin with the bae')
      visit '/peeps'
      expect(page).to have_content "Peep: Just chillin with the bae (2017-09"
      expect(page).to have_content "Peep: Hello world! (2017-09"
    end
  end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Can see the time a peep was posted' do
  scenario 'user wants to see the time created of peep' do
    Peep.create(message: 'Hello world!')
    visit '/peeps'
    expect(page).to have_content "Peep: Hello world! (2017-09"
  end
end
# I had some problems with the implementation of :created_at,
# DateTime or TimeNow in my testing,
# will have to review this next week and create some working mocks.


# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'I can sign up for Chitter' do
  scenario 'new user signs up and account is created' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome James')
    expect(User.first.email).to eq('james@example.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I can\'t sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end

feature 'A user can sign in on Chitter' do
  let!(:user) do
    User.create(email:                 'james@example.com',
                name:                  'James',
                password:              'password!',
                password_confirmation: 'password!')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome #{user.name}"
  end

end

feature 'User signs out' do

  before(:each) do
    User.create(email:                 'test@test.com',
                name:                  'test',
                password:              'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Log out'
    expect(page).to have_content('You have been logged out')
    expect(page).not_to have_content('Welcome test')
  end

end


def sign_up(email: 'james@example.com',
            name:  'James',
            password: 'password!',
            password_confirmation: 'password!')
   visit '/users/new'
   fill_in :email, with: email
   fill_in :name,  with: name
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Create account'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
