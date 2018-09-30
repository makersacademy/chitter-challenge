feature 'Displays all peeps' do
  scenario 'Displays peep text' do
    clear_database
    populate_database
    visit ('/')
    sign_up
    expect(page).to have_content('test1')
    expect(page).to have_content('test2')
  end

  scenario 'Displays time peep was posted' do
    clear_database
    populate_database
    visit ('/')
    sign_up
    fill_in 'peep', with: 'time_test'
    click_button 'peep'
    expect(page).to have_content(Time.now.strftime "%d-%^b-%Y %H:%M")
  end
end
