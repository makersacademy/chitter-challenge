feature 'Sign up' do
  scenario 'When a user succesfully signs up, he gets a welcome message on homepage' do
    signup
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome Alex'
  end

  scenario 'When a user puts wrong confirmation password, gets an error' do
    signup(password_confirmation: 'wrong')
    expect(current_path).to eq '/users/signup'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
