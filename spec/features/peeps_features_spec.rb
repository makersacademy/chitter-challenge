feature 'Displays all peeps' do
  scenario 'Displays peep text' do
    clear_database
    populate_database
    visit ('/')
    fill_in 'peep', with: 'test3'
    click_button 'peep'
    expect(page).to have_content('test1')
    expect(page).to have_content('test2')
    expect(page).to have_content('test3')
    expect(page).to have_content(Time.now.strftime "%d-%^b-%Y %H:%M")
  end

  scenario 'Displays time peep was posted' do
    clear_database
    populate_database
    visit ('/')
    fill_in 'peep', with: 'test3'
    click_button 'peep'
    expect(page).to have_content(Time.now.strftime "%d-%^b-%Y %H:%M")
  end
end
