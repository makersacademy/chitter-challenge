feature 'repeat username edge case' do
  scenario 'user tries to insert username that already exists' do
    sign_up
    visit('/users/new')
    fill_in('name', with: 'Second Example Name')
    fill_in('username', with: 'Second exampleusername')
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'secondexamplepassword')
    click_button('Submit')

    expect(current_path).to eq('/users/new')
    expect(page).to have_content('There is already an account with the email address.')
  end
end
