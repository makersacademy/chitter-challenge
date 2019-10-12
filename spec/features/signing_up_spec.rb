feature 'Signing up' do

  scenario 'homepage has sign up button' do
    visit('/')
    expect(page).to have_button 'Sign up!'
  end

  scenario 'homepage has sign up button' do
    visit('/')
    click_button 'Sign up!'
    fill_in 'email', with: 'Example@mail.co.uk'
    fill_in 'password', with: 'Secret Password'
    fill_in 'name', with: 'Joe Bloggs'
    fill_in 'username', with: 'JBloggers'
    expect(page).to have_button 'Submit'
  end

end
