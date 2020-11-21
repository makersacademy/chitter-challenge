feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_on('Sign Up')
    fill_in('name', with: 'Craig David')
    fill_in('email', with: 'Craig@David.com')
    fill_in('password', with: 'rewind1')
    fill_in('username', with: 'BoSelecta')
    click_button('Submit')
    expect(page).to have_content "Thanks for signing up to Chitter!"
  end
end
