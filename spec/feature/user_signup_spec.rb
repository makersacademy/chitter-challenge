feature 'Test homepage signup form' do
  scenario 'has a signup form' do
    visit('/')

    fill_in('username', with: 'JPRudrum')
    fill_in('password', with: 'AFC4LYF')
    fill_in('email', with: 'jr@gmail.com')
    click_button('Sign Up!')

    expect(page).to have_current_path "/posts"
  end
end
