feature 'User can sign up for Chitter' do 
  scenario 'User signs up with email, password, name and username' do 
    visit '/'
    click_on 'Sign up'
    fill_in 'email', with: 'johnsmith@fakeemail.com'
    fill_in 'password', with: 'Pas$word123'
    fill_in 'user_name', with: 'John Smith'
    fill_in 'handle', with: 'the_real_john_smith'
    click_on 'Submit'
    expect(page).to have_content 'Thanks for signing up for Chitter John Smith!'
  end
end