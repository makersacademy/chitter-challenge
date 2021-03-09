feature 'registration' do
  scenario 'a user can sign up' do
    visit('/users/new')
    fill_in('email', with:'fake_email@testing.com')
    fill_in('fullname', with:'John Jones')
    fill_in('username', with:'JJones')
    fill_in('password', with:'password123')
    click_button('Submit')

    expect(page).to have_content("Welcome, JJones")
  end
end
