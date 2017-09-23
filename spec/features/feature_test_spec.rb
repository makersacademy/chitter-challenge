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
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'james@example.com'
  fill_in :name,     with: 'James'
  fill_in :password, with: 'password!'
  click_button 'Create account'
end
