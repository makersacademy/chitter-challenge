feature 'sign up' do
  scenario 'I am able to sign up for a chitter account' do
    visit('/users/new')
    fill_in('name', with: 'Example Name')
    fill_in('username', with: 'exampleusername')
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'examplepassword')
    click_button('Submit')

    expect(page).to have_content('Signed in as Example Name')
  end
end