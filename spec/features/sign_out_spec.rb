feature 'Signing out' do
  scenario 'user should be able to sign out' do
    sign_in
    sign_out
    expect(current_path).to eq '/session/new'
    expect(page).not_to have_content 'Welcome, htunny!'
    expect(page).to have_content 'Goodbye, htunny!'
  end
end
