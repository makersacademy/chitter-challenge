feature 'create a user' do
  scenario 'a user can sign up to Chitter' do
    visit '/users/signup'
    fill_in 'username', with: 'harrypotter'
    fill_in 'email', with: 'harrypotter@gmail.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_button 'Sign up'
    
    expect(page).to have_content "What's happening harrypotter!?"
  end
end
