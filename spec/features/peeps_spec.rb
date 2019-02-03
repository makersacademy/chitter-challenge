feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep) VALUES('To get much done in little time');")
    connection.exec("INSERT INTO peeps (peep) VALUES('I stick to the pomodoro technique');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Being methodical and sensible');")
    visit('/peeps')
    expect(page).to have_content "Being methodical and sensible"
    expect(page).to have_content "I stick to the pomodoro technique"
    expect(page).to have_content "To get much done in little time"
  end

  scenario 'A user can add a new peep' do
    visit('/peeps')
    fill_in('peep', with: 'A new peep added by the user')
    click_on('Submit')
    expect(page).to have_content "A new peep added by the user"
  end
end
