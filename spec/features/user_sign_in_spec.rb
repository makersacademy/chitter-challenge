feature 'Sign in' do
  scenario 'I can sign in to my account' do
    # sign_up
    sign_in
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome, Cloud Strife'
  end
  scenario 'I am shown an error if I enter incorrect login details' do
    sign_in_wrong_details
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email or password entered is incorrect'
  end
end
