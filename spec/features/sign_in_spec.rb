feature 'authentication' do
  scenario 'a user can sign in' do
    sign_in

    expect(page).to have_content 'Welcome to Chitter, Asensio!'
  end
end
