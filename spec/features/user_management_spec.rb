require 'byebug'

feature 'user signs up' do
  scenario 'a new user visits the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hi then, user9319062')
    expect(User.first.email).to eq('test@testes.com')
  end

  def sign_up(username = 'user9319062',
              name = 'Denble Xaia',
              email = 'test@testes.com',
              password = 'pass_merde')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end

end