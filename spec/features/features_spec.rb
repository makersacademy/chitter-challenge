
feature 'I want to sign up for Chitter' do
  scenario 'Allows a user to sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
end

feature 'Sign in and do' do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'User can sign out' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign Out'
    expect(page).to have_content('goodbye!')
    expect(page).to_not have_content('Welcome, test@test.com')
  end

   scenario 'User can post a message' do
     sign_in(email: 'test@test.com', password: 'test')
     add_peep(message: "Hello, world!")
     expect(Peep.first.message).to eq "Hello, world!"
     expect(page).to have_content('Hello, world!')
   end

  scenario 'Create three peeps and view them in reverse order' do
    sign_in(email: 'test@test.com', password: 'test')
    add_peep(message: 'Created first ')
    add_peep(message: 'Created second ')
    add_peep(message: 'Created third ')
    expect(page).to have_content("Created third #{Time.now.strftime('%H:%M %d-%b-%y')} "\
    "test Created second #{Time.now.strftime('%H:%M %d-%b-%y')} "\
    "test Created first")
  end

  scenario 'View peeps with timestamps' do
    sign_in(email: 'test@test.com', password: 'test')
    add_peep(message: 'Peeped at: ')
    expect(page).to have_content("Peeped at: #{Time.now.strftime('%H:%M')}")
  end

  scenario 'User can peep, sign out and still see peep' do
    sign_in(email: 'test@test.com', password: 'test')
    add_peep(message: 'This should persist')
    click_button 'Sign Out'
    expect(page).to have_content('This should persist')
  end

  scenario 'I cannot post a peep if I have not signed in' do
    visit '/'
    expect(page).not_to have_content("Compose Peep")
  end
end
