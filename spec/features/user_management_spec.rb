require './spec/spec_helper'

feature 'User signs up' do
  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, aliceB')
    expect(User.first.email).to eq('yoyo@ma.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end

  def sign_up(email = 'yoyo@ma.com',
              handle = 'aliceB',
              password = 'oranges!',
              password_confirmation = 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :handle, with: handle
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'sign up'
  end

end

feature 'User signs in' do

  before (:each) do
    User.create(email: 'test@test.com',
                handle: 'grandma',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, grandma')
    sign_in('test@test.com', 'test')
    expect(page).to have_content('Welcome, grandma')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, grandma')
    sign_in('test@test.com','wrong')
    expect(page).not_to have_content('Welcome, grandma')
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'sign in'
  end
end

feature 'User signs out' do
  before(:each) do
    User.create(email: 'test@test.com',
                handle: 'grandma',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button 'sign out'
    expect(page).to have_content('later, man')
    expect(page).not_to have_content('Welcome, grandma')
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'sign in'
  end
end
