feature 'User sign up' do
  scenario 'A user can access sign up from home page' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_content 'Sign up to Chitter'
  end

  scenario ''

end
