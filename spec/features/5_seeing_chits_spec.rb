feature 'Not logged in' do
  scenario 'can view chits in reverse chronological order' do
    user_sign_up
    fill_in('chit_text', with: 'first chit')
    click_button('Chit!')
    fill_in('chit_text', with: 'second chit')
    click_button('Chit!')
    click_button('Log out')
    click_button('View chits')
    expect(page).to have_content('second chit' + ' ' + 'first chit')
  end
end