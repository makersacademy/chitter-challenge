# User Story currently being tested:

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User can sign up' do

  def sign_up(username="ashleighpants", email="ash@ash.com", password="pass", password_confirmation="pass")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  scenario 'As a new user visiting site' do
    visit '/'
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, ash@ash.com'
    expect(User.first.email).to eq 'ash@ash.com'
  end

  scenario 'But not with a password that doesn\'t match' do
    expect { sign_up('ashleighpants', 'ash@ash.com', 'pass', 'wrong') }.to change(User, :count).by 0
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'But not with an email that is already registered or if username already taken' do
    expect { sign_up }.to change(User, :count).by 1
    expect { sign_up }.to change(User, :count).by 0
    expect(page).to have_content('This email is already taken')
  end

end

feature 'User can sign in' do

  before(:each) do
    User.create(username: 'ashleighpants',
                email: 'ash@ash.com',
                password: 'pass',
                password_confirmation: 'pass')
  end

  def sign_in(username, email, password)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end

  scenario 'With correct log in details' do
    visit '/'
    expect(page).not_to have_content 'Welcome, ash@ash.com'
    sign_in 'ashleighpants', 'ash@ash.com', 'pass'
    expect(page).to have_content 'Welcome, ash@ash.com'
  end

  scenario 'But not with incorrect log in details' do
    visit '/'
    expect(page).not_to have_content 'Welcome, ash@ash.com'
    sign_in 'ashleighpants', 'ash@ash.com', 'wrong'
    expect(page).not_to have_content 'Welcome, ash@ash.com'
  end

end

feature 'User can sign out' do

  def sign_in(username, email, password)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end

  before(:each) do
    User.create(username: 'ashleighpants',
                email: 'ash@ash.com',
                password: 'pass',
                password_confirmation: 'pass')
  end

  scenario 'after having signed in' do
    visit '/'
    sign_in 'ashleighpants', 'ash@ash.com', 'pass'
    expect(page).to have_content 'Welcome, ash@ash.com'
    click_button 'Sign Out'
    # expect(page).to have_content 'Goodbye!'    FLASH NOTICE
    expect(page).not_to have_content 'Welcome, ash@ash.com'
  end
end
