feature 'sign up experience' do
  scenario 'user enters necessary details' do
    visit '/sign-up'
    fill_in 'email_address', with: 'test@example.com'
    fill_in 'user_name', with: 'chocolate_rain'
    fill_in 'real_name', with: 'Alexander Dominic Chalk'
    fill_in 'password', with: 's3cr3t'
    click_on 'Sign Up'
    expect(current_path).to eq '/chitter-newsfeed'
    expect(page).to have_content 'Welcome, Alexander Dominic Chalk'
  end
end
