# require_relative './../spec_helper'
# require './app/data_mapper_setup'
# require './app/models/user'
feature 'Use sign up' do 
  def sign_up(email: 'moha@ibra.com', password: 'oranges!', username: 'minhaj', name: 'mohamed issaq')
    visit '/users/new'
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :username, with: username
    fill_in :name,     with: name
    click_button 'Sign up'
  end

  scenario 'I can sign in as a user' do 
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, minhaj')
    expect(User.first.email).to eq('moha@ibra.com')
  end

  def sign_in(username: 'minhaj', password: 'oranges!')
    visit '/signin/sign_in'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end

  scenario 'the sign in information is removed from the browser session' do
    sign_up
    sign_in
    click_button('Sign out')
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, minhaj')
  end

scenario 'I can sign up as a new user' do
  sign_up
  sign_in
  expect(page).to have_content 'Welcome, minhaj'
  end
end


