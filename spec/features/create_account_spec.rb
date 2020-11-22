require 'capybara/rspec'

feature 'Registration' do
  scenario 'User can create an account' do
    visit('/')
    click_button('Register')
    expect(current_path).to eq('/create-account')
    fill_in('username', with: 'partario')
    fill_in('email', with: 'partario@gmail.com')
    fill_in('password', with: '1234')
    click_button('Submit')
    expect(current_path).to eq('/')
    expect(page).to have_content('Account created succesfully, log in below!')
  end

  scenario 'error displayed if user/email exists' do
    User.create(username: "partario", email: 'partario@gmail.com', password: '1234')
    visit('/')
    click_button('Register')
    expect(current_path).to eq('/create-account')
    fill_in('username', with: 'partario')
    fill_in('email', with: 'partario@gmail.com')
    fill_in('password', with: '1234')
    click_button('Submit')
    expect(current_path).to eq('/create-account')
    expect(page).to have_content('Account name/email exist, try again!')
  end
end
