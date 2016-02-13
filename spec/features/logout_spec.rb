feature 'Logout' do
  scenario 'When a user logs out, a Goodbye message is displayed on homepage' do
    signup
    logout
    expect(current_path).to eq '/'
    expect(page).to have_content 'Goodbye Alex'
  end
end
