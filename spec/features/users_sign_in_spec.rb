feature 'User sign in' do
  scenario 'with correct credentials' do
    sign_up
    sign_in
    expect(page).to have_content 'alice@example.com'
  end
end
