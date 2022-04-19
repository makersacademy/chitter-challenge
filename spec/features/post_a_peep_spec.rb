feature "#post" do
  scenario 'Allows user to post a message (peep)' do
    visit '/users/new'
    fill_in('email', with: 'test@gmail.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Jordan')
    fill_in('username', with: 'jordanschitter')
    click_button('Sign up')

    fill_in('peep', with: "My first peep")
    click_button("Peep")
    expect(page).to have_content "My first peep"
  end
end
