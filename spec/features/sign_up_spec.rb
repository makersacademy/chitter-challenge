feature 'signing up' do
  scenario 'user can sign up' do
    sign_up

    expect(page).to have_content 'Welcome to Chitter, Asensio!'
  end
end
