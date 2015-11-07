
feature 'Validate name on sign up' do
  scenario 'Missing username' do
    sign_up_with_missing_username
    expect(page).to have_content 'Username must not be blank'
  end
end

