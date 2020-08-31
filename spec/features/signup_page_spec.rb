feature 'user signup' do
  scenario 'loads the signup page and form' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
    expect(page).to have_field 'username'
    expect(page).to have_field 'email'
    expect(page).to have_field 'password'
    expect(page).to have_button 'Create account'
  end
end
