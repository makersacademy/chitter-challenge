feature 'registration' do 
  scenario 'a user can sign up' do 
    visit '/'
    fill_in('email', with: 'text@example.com')
    fill_in('password', with: 'password321')
    fill_in('username', with: 'Cowscomehome')
    click_button('Submit')

    expect(page).to have_content "Welcome, Cowscomehome"
  end 
end
