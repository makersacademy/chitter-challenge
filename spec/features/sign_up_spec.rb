feature 'Signing Up' do
  scenario 'Lets you sign up for chitter' do
    visit('/')
    click_button('Sign Up')
    fill_in('username', with: 'charliecodes')
    fill_in('firstname', with: 'Charlie')
    fill_in('secondname', with: 'Fischer')
    fill_in('password', with: 'password')
    fill_in('email', with: 'charlie@makersacademy.com')
    click_button('Join')
    expect(page).to have_content "Hello charliecodes"
  end
end
