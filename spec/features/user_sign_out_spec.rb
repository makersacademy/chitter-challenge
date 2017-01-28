feature 'Sign out' do
  scenario 'I can sign out of my account' do
    sign_in
    sign_out
    expect(current_path).to eq '/'
    expect(page).to have_content 'Goodbye'
  end
end
