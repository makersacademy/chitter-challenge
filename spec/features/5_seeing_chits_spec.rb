feature 'Not logged in' do
  scenario 'can view chits in reverse chronological order' do
    user_sign_up ; first_chit ; second_chit
    user_log_out_and_view_chits
    expect(page).to have_content(
      'second chit' + ' ' + @second_time + ' ' + 'Deadpool' + ' ' +
      'first chit' + ' ' + @first_time + ' ' + 'Deadpool')
  end

  scenario 'can view chits with author' do
    user_sign_up; first_chit
    expect(page).to have_content('first chit' + ' ' + @first_time + ' ' +
    'Deadpool')
  end
end
