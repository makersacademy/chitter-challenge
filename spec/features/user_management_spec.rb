require_relative '../web_helper'

feature 'User sign up' do
  let(:email) { 'maker@makers.com' }
  let(:password) { '000000' }

  scenario 'I can sign up as a new user' do
    expect { sign_up(email: email, password: password) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, #{email}")
    expect(User.first.email).to eq(email)
  end
end

feature 'User sign in' do
  let(:email) { 'maker@makers.com' }
  let(:password) { '000000' }
  let!(:user) do
    User.create(email: email, password: password)
  end

  scenario 'with correct credentials' do
    sign_in(email: email, password: password)
    expect(page).to have_content("Welcome, #{email}")
  end

  scenario 'with incorrect credentials' do
    sign_in(email: user.email, password: '000001')
    expect(page).to have_content('The email or password is incorrect')
  end
end

feature 'User signs out' do
  let(:email) { 'maker@makers.com' }
  let(:password) { '000000' }

  before(:each) do
    User.create(email: email, password: password)
  end

  scenario 'while being signed in' do
    sign_in(email: email, password: password)
    click_button('Sign out')
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content("Welcome, #{email}")
  end
end
