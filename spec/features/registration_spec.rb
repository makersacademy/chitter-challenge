feature 'registration' do
  scenario 'a user can sign up' do
    sign_up

    expect(page).to have_content "Welcome, testname"
  end

end
