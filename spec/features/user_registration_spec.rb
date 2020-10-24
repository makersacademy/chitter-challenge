feature 'user registration' do
  scenario 'user can sign up' do
    sign_up

    expect(page).to have_content "John Smith"
  end
end