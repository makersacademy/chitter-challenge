feature 'Add User' do
  scenario 'should have the option to add a user' do
    visit '/'
    expect(page).to have_button 'Sign Up'
  end

  scenario 'should have the four required fields' do
    visit '/signup'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Password'
  end
end 