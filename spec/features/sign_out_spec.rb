feature 'allow user to sign out' do
  scenario 'user successfully signs out' do
    user_create
    sign_in
    sign_out

    expect(page).to have_content('Successfully signed out')
    expect(current_path).to eq '/'
  end
end
