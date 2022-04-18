feature 'viewing peeps' do 
  scenario ' user can view all the posts' do
    current_timestamp = Time.now
    DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES($1, $2);", ['how are you?', current_timestamp ])
    DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES($1, $2);", ['Let us discuss', current_timestamp ])
    visit('/peeps')
    expect(page).to have_content 'how are you?'
    expect(page).to have_content 'Let us discuss'
  end
end
