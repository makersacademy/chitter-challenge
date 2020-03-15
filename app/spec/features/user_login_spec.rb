feature 'registration' do
   scenario 'user can setup an account' do
    visit('/login')
    fill_in('username', with: "testusername")
    fill_in('email', with: 'testemail@gmail.com')
    fill_in('name', with: 'testname')
    fill_in('password', with: 'testpassword')
    click_button("Submit")

    expect(page).to have_content('testusername', 'testemail@gmail.com')
  end
end
