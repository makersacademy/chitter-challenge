feature 'signing up' do
  scenario 'user can sign up' do
    sign_up

    expect(page).to have_content 'Welcome to Chitter, MarcoAsensio!'
  end

  scenario 'same email cannot be used twice' do
    sign_up

    expect(page).to have_content 'Email is already taken'
  end
end
