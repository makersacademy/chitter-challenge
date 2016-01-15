feature 'Not logged in' do
  first_time = Time.local(2008, 9, 1, 10, 5, 0).strftime("%d %b at %H:%M")
  second_time = Time.local(2009, 4, 1, 11, 7, 0).strftime("%d %b at %H:%M")
  scenario 'can view chits in reverse chronological order' do
    user_sign_up
    Timecop.freeze(Time.local(2008, 9, 1, 10, 5, 0))
    fill_in('chit_text', with: 'first chit')
    click_button('Chit!')
    Timecop.return
    Timecop.freeze(Time.local(2009, 4, 1, 11, 7, 0))
    fill_in('chit_text', with: 'second chit')
    click_button('Chit!')
    click_button('Log out')
    click_button('View chits')
    expect(page).to have_content(
      'second chit' + ' ' + second_time + ' ' +
      'first chit' + ' ' + first_time)
  end
end