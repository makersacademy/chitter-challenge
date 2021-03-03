feature 'editing user details' do
  scenario 'details change after editing' do
    sign_up_and_get_peeping

    click_button 'My Account'

    expect(page).to have_content 'test'
    expect(page).to have_content 'test_name'
    expect(page).to have_content 'test@test.com'

    click_button 'Edit'

    fill_in('username', with: 'new_user')
    fill_in('name', with: 'new_name')
    fill_in('email', with: 'new@email.com')

    click_button 'Save'

    expect(page).not_to have_content 'test'
    expect(page).not_to have_content 'test_name'
    expect(page).not_to have_content 'test@test.com'

    expect(page).to have_content 'new_user'
    expect(page).to have_content 'new_name'
    expect(page).to have_content 'new@email.com'
  end
end
