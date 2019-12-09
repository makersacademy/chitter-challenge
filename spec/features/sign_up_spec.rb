feature 'sign up' do
  scenario 'sign up for Chitter' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'name', with: 'Julie'
    fill_in 'username', with: 'jj'
    fill_in 'email', with: 'abcd@gmail.com'
    fill_in 'password', with: 'abcd1234'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome to Chitter! Julie'    
  end
end