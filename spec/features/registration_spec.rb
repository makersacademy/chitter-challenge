feature 'registration' do
  scenario 'a user can sign up' do
    sign_in
    expect(page).to have_content "Welcome to Chitter, Test"
  end
end
