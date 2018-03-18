feature 'registration' do
  scenario 'a user can sign up' do
    create_test_account
    expect(page).to have_content "Welcome Tester!"
  end
end
