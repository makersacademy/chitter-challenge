require './lib/SessionHelpers'
include SessionHelpers

feature 'User signs up' do
  scenario 'when being a new user visiting Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello Sexy_frenchman')
    expect(User.first.email).to eq('Guillaume@chittest.com')
  end

  scenario 'with a password that doesn\'t match' do
    expect { sign_up('a@bc.com', 'abc', 'Ab Cd' 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, your passwords do not match')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already registered')
  end

  scenario 'with a username that is already taken' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This username is already taken')
  end
end

feature 'User signs in' do
  before(:each) do
    User.create(email: 'test@test.com',
                username: 'Mister_Test',
                name: 'Tasty Tester',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Hello Mister_Test')
    sign_in('Mister_Test', 'test')
    expect(page).to have_content('Hello Mister_Test')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Hello Mister_Test')
    sign_in('Mister_Test', 'wrongpass')
    expect(page).not_to have_content('Hello Mister_Test')
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                username: 'Mister_Test',
                name: 'Tasty Tester',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in('Mister_Test', 'test')
    click_button 'Sign out'
    expect(page).to have_content('Good bye!') # where does this message go?
    expect(page).not_to have_content('Hello Mister_Test')
  end
end
