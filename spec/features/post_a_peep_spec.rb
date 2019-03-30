require 'pg'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a peep' do
  scenario 'The user can post a new peep' do
    connection = PG.connect(dbname: 'chitter_test')
    visit '/'
    fill_in 'peep_content', with: "First peep w00t!!"
    click_button 'Peep'
    result = connection.exec("SELECT * FROM peeps")
    expect(result[0]['content']).to eq "First peep w00t!!"
  end
end
