feature 'users can make a comment' do
  scenario 'a user logs in and peeps' do
    create_test_account
    sign_in
    fill_in 'text', with: 'test123'
    click_button 'peep'
    expect(page).to have_content 'test123'
  end
end
