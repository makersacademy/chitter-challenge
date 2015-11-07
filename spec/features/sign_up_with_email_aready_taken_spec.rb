feature 'Not allowed to use same email' do
  scenario 'Email already taken' do
    sign_up_with_valid_details
    sign_up_with_duplicate_email
    expect(page).to have_content 'Email is already taken'
  end
end
