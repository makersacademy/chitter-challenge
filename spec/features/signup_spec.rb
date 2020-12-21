feature 'a user can sign up to Chitter' do
  scenario 'as a user, i can create a peep and see that it was posted by me' do
    visit '/'
    click_button 'Sign Up'
    fill_in :username, with: 'Otis'
    fill_in :email, with: 'otis@gmail.com'
    click_button 'Submit'
    expect(page).to have_content 'You are logged in as: Otis'
  end
end
