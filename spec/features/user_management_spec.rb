require 'spec_helper'

feature 'User signs up' do

  scenario 'when being a new visitor visiting the site' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, example')
    expect(User.first.email).to eq('example@example.com')
  end

  scenario 'with a password that doesnt match' do
    expect{ sign_up('example', 'example@example.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'with an email which is already registered' do
    sign_up
    expect{ sign_up }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('This email address is already registered')
  end

  scenario 'with a username which is already taken' do
    sign_up
    expect{ sign_up }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('This username is already taken')
  end
  
  def sign_up(name = 'example',
              email = 'example@example.com',
              username = 'example',
              password = 'example',
              password_confirmation = 'example')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name,     :with => name
    fill_in :email,    :with => email
    fill_in :username, :with => username
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button 'Sign up'  
  end

  feature 'User signs in' do

    before(:each) do
      User.create(:name => 'Tester',
                  :email => 'test@test.com',
                  :username => 'tester',
                  :password => 'test',
                  :password_confirmation => 'test')
    end

    scenario 'with correct credentials' do
      visit '/'
      expect(page).not_to have_content('Welcome, tester')
      sign_in('tester', 'test')
      expect(page).to have_content('Welcome, tester')
    end

    scenario 'with incorrect credentials' do
      visit '/'
      expect(page).not_to have_content('Welcome, tester')
      sign_in('tester', 'wrong')
      expect(page).not_to have_content('Welcome, tester')
    end

    def sign_in(username, password)
      visit '/sessions/new'
      fill_in 'username', :with => username
      fill_in 'password', :with => password
      click_button 'Sign in'
    end
  end

  feature 'User signs out' do

    before(:each) do
      User.create(:name => 'Tester',
                  :email => 'test@test.com',
                  :username => 'tester',
                  :password => 'test',
                  :password_confirmation => 'test')
    end

    scenario 'while being signed in' do
      sign_in('tester', 'test')
      click_button 'Sign out'
      expect(page).to have_content('Good bye!')
      expect(page).not_to have_content('Welcome, tester')
    end

    def sign_in(username, password)
      visit '/sessions/new'
      fill_in 'username', :with => username
      fill_in 'password', :with => password
      click_button 'Sign in'
    end

  end

end