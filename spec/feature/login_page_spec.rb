feature 'Login page' do 
  scenario 'Has boxes for loging in and a button to take a user to a sign up page' do 
    visit('/')
    expect(page).to have_button('Sign Up')
    expect(page).to have_button('Sign In')
    expect(page).to have_field('Username')
    expect(page).to have_field('Password')
  end
end 