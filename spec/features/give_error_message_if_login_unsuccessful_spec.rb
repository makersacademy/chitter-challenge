feature 'allow login' do
  scenario 'throw error message when login details are incorrect' do
    build_maker
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!' and 'OR'
    expect(page).to have_button('View all Peeps')
    expect(page).to have_button('Signup')
    expect(page).to have_button('Login')
    expect(page).to have_content "to post a peep!"
    click_button 'Login'
    expect(current_path).to eq '/chitter/login'
    fill_in :email, with: 'joebloggs@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'
    expect(page).to have_content 'Login details incorrect, please try again'
    expect(page).to have_button 'back to login page'
    expect(current_path).to eq '/chitter/login/error'
    click_button 'back to login page'
    expect(current_path).to eq '/chitter/login'
    expect(page).to have_button 'back to mainpage'
    click_button 'back to mainpage'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome to Chitter!' and 'OR'
    expect(page).to have_button('View all Peeps')
    expect(page).to have_button('Signup')
    expect(page).to have_button('Login')
    expect(page).to have_content "to post a peep!"

  end
end
