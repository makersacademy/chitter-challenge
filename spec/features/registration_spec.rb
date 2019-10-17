feature 'registration' do
  scenario 'a user can sign up' do
    visit '/new_user'
    fill_in('User Name', with: 'Test')
    fill_in('Password', with: 'password123')
    fill_in('Email', with: 'test@example.com')
    click_button('Submit')

    expect(page).to have_content "Test"
  end
end
