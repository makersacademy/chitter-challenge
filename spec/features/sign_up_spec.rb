feature 'Sign up' do
  scenario 'user can sign up to chitter' do
    visit('/')
    click_button 'Sign up'
    fill_in 'email', with: 'zaira@me.org'
    fill_in 'password', with: '1234'
    fill_in 'name', with: 'Zaira Rasool'
    fill_in 'username', with: 'zraso'
    click_button 'Sign up'
    expect(current_path).to eq ('/users')
    expect(page).to have_content 'Sign up successful'
  end
end
