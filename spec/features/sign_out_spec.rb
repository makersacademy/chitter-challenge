feature 'Singout' do
 before(:each) do
    User.create(name: 'Sachin', email: 'sachin_rocks@gmail.com', 
      password: "1234", 
      password_confirmation: "1234" )
  end

  scenario 'A user can signout' do
    signin("sachin_rocks@gmail.com", "1234")
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome Factory')
  end
end