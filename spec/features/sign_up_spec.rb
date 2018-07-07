feature 'Signing up' do
  scenario 'A user can sign up for Chitter' do
    visit '/'
    click_button 'Sign Up'
    fill_in :name, with: 'Jane Doe'
    fill_in :username, with: 'JaneDoe'
    fill_in :email, with: 'janedoe@google.com'
    fill_in :password, with: 'pa$$w0rd'
    click_button 'Sign Up'
    expect(page).to have_content 'Welcome to Chitter Jane Doe'
  end
end
