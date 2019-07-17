feature 'viewing peeps' do
  scenario 'user can click view button' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'peeps')
  end

  scenario 'user can view list of bookmarks' do
    connection = PG.connect(dbname: 'chitter_peeps_test')

    connection.exec("INSERT INTO peeps VALUES('Rianne', 'riannemccartney@hotmail.com', 'Today is Wednesday ', '10.43')")
    visit '/'
    click_button 'View peeps'
    expect(page).to have_content "Today is Wednesday "
  end
end
