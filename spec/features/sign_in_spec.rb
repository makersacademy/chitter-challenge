require "spec_helper.rb"

feature 'User sign in' do
  let(:user) do
    User.create(name: 'Dave',
                username: 'Big Dave',
                email: 'dave@email.com',
                password: 'secret123')
  end

  scenario 'with correct credentials' do
    visit '/'
    fill_in :username, with: 'Big Dave'
    fill_in :password, with: 'secret123'
    click_button 'Sign in'
    expect(page).to have_content "Welcome, #{user.username}"
  end
end
