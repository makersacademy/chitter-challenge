feature 'sign up' do

  scenario 'user can create an account' do
    visit '/'
    click_on 'Create Account'
    fill_in 'username', with: 'dbacall'
    fill_in 'email', with: 'dbacall@hotmail.co.uk'
    fill_in 'password', with: 'password'
    click_on 'Create'
    expect(page).to have_content 'Account created. Welcome dbacall!'
  end

end