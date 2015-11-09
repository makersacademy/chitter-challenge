feature 'Not allowed to use same username' do
  scenario 'Username already taken' do
    sign_up_with_valid_details
    sign_up_with_duplicate_username
    expect(page).to have_content 'Username is already taken'
  end
end
