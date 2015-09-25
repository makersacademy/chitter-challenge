

feature 'User sign up' do


  scenario 'I can sign up as a new user' do
    user = User.new
    fill_in :username, with: 'pip'
    fill_in :username, with:("pip@example.com")
    click_button 'Sign up'
    expect(page).to have_content('Welcome, pip')
    expect(User.first.email).to eq('dom@example.com')
  end

end
