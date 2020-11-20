feature 'Sign up to Chitter' do
  scenario 'Maker sees sign up page and enter details' do
    visit '/chits'
    click_link('Sign up to say something...')
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Master Chitter')
    fill_in('username', with: 'mchitter')
    click_button('Sign Up')
    expect(page).to have_content 'Welcome to Chitter, mchitter'
  end
end