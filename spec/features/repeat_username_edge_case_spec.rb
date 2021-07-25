feature 'repeat username edge case' do
  scenario 'user tries to insert username that already exists' do
    sign_up
    visit('/users/new')
    fill_in('name', with: 'Second Example Name')
    fill_in('username', with: 'exampleusername')
    fill_in('email', with: 'secondexample@example.com')
    fill_in('password', with: 'secondexamplepassword')
    click_button('Submit')

    expect(current_path).to eq('/users/new')
    expect(page).to have_content('That username is already taken.')
  end
end