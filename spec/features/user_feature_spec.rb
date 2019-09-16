feature 'Signup' do
  def visit_homepage_and_signup
    visit '/'
    click_button 'Sign up'
    fill_in 'username', with: 'abc'
    fill_in 'email', with: 'abc@testemail.com'
    fill_in 'password', with: '123456'
    fill_in 'password_confirmation', with: '123456'
    click_button 'Sign up'
  end

  scenario 'New user signup successful' do
    visit_homepage_and_signup
    expect(current_path).to eq '/home'
  end

  scenario 'signup fails due to password mismatch' do
    visit '/'
    click_button 'Sign up'
    fill_in 'username', with: 'abc'
    fill_in 'email', with: 'abc@testemail.com'
    fill_in 'password', with: '123456'
    fill_in 'password_confirmation', with: '12345'
    click_button 'Sign up'
    expect(page).to have_content 'Passwords do not match'
  end

  scenario 'signup fails due to username already exists' do
    visit_homepage_and_signup
    visit '/'
    click_button 'Sign up'
    fill_in 'username', with: 'abc'
    fill_in 'email', with: 'abc@testemail.com'
    fill_in 'password', with: '123456'
    fill_in 'password_confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content 'Username already exists'
  end
end
