feature 'registration' do
  scenario 'a user can sign up to chitter' do
    visit '/users/new'
    fill_in('email', with: 'example@lycos.com')
    fill_in('password', with: 'fakepassword')
    click_button("Submit")

    expect(page).to have_content 'example@lycos.com'
  end
end
