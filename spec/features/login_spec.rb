feature 'Logging in' do

  scenario 'homepage has login button' do
    visit('/')
    expect(page).to have_button 'Login!'
  end

  scenario 'homepage has sign up button' do
    visit('/')
    click_button 'Sign up!'
    fill_in 'email', with: 'Example@mail.co.uk'
    fill_in 'password', with: 'Secret Password'
    fill_in 'name', with: 'Joe Bloggs'
    fill_in 'username', with: 'JBloggers'
    click_button 'Submit'
    click_button 'Login'
    fill_in 'email', with: 'Example@mail.co.uk'
    fill_in 'password', with: 'Secret Password'
    click_button 'Login!'
    expect(page).to have_content 'Joe Bloggs logged in as JBloggers'
  end

end
