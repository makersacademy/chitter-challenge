feature 'Sign up' do
  scenario 'allows users to sign-up' do
    visit('/')
    click_link('Sign up')

    fill_in('username', with: "Marcus")
    fill_in('password', with: "passw0rd")
    click_button('Sign up')

    expect(page).to have_content('You are logged in as @Marcus')
  end
end
