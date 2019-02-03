feature 'Viewing cheets' do
  scenario 'A user can see cheets' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO cheets (cheet) VALUES('To get much done in little time');")
    connection.exec("INSERT INTO cheets (cheet) VALUES('I stick to the pomodoro technique');")
    connection.exec("INSERT INTO cheets (cheet) VALUES('Being methodical and sensible');")
    visit('/cheets')
    expect(page).to have_content "Being methodical and sensible"
    expect(page).to have_content "I stick to the pomodoro technique"
    expect(page).to have_content "To get much done in little time"
  end
end
