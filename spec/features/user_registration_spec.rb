feature 'user registration' do
  scenario 'user can sign up' do
    sign_up

    expect(page).to have_content "John Smith"
  end

  scenario 'handle and email must be unique' do
    sign_up
    sign_up
    expect(page).to have_content("User handle or email taken")
  end
end
