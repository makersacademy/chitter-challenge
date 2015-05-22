# User Story currently being tested:

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User can sign up' do

  def sign_up(email="ash@ash.com", password="pass", password_confirmation="pass")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  scenario 'As a new user visiting site' do
    visit '/'
    expect{ sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, ash@ash.com'
    expect(User.first.email).to eq 'ash@ash.com'
  end

  scenario 'But not with a password that doesn\'t match' do
    expect{ sign_up('ash@ash.com', 'pass', 'wrong') }.to change(User, :count).by 0
    # INCLUDE FLASH MESSAGE EXPECTANCY
  end

  scenario 'But not with an email that is already registered' do
    expect{ sign_up }.to change(User, :count).by 1
    expect{ sign_up }.to change(User, :count).by 0
    # INCLUDE FLASH MESSAGE EXPECTANCY
  end

end

feature 'User can sign in' do

  before(:each) do
    User.create(email: 'ash@ash.com', password: 'pass', password_confirmation: 'pass')
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end

  scenario 'With correct log in details' do
    visit '/'
    expect(page).not_to have_content 'Welcome, ash@ash.com'
    sign_in 'ash@ash.com', 'pass'
    expect(page).to have_content 'Welcome, ash@ash.com'
  end

  scenario 'But not with incorrect log in details' do
    visit '/'
    expect(page).not_to have_content 'Welcome, ash@ash.com'
    sign_in 'ash@ash.com', 'wrong'
    expect(page).not_to have_content 'Welcome, ash@ash.com'
  end

end