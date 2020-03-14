require 'pg'

feature 'Seeing peeps' do
  scenario 'I want to see all peeps in chitter in reverse chronological order' do
  #   connection = PG.connect(dbname: 'chitter_test')
  #   connection.exec("INSERT INTO peeps (peep) VALUES ('I am the first peep');")
  #   connection.exec("INSERT INTO peeps (peep) VALUES ('I am the second peep');")

  # Refactor
    Chitter.post_peep(peep: 'I am the first peep', post_time: '12:00')
    Chitter.post_peep(peep: 'I am the second peep', post_time: '12:00')

    visit('/chitter')

    # Test the reverse chronological order
    expect(page.find('li:nth-child(1)')).to have_content 'I am the second peep'
    expect(page.find('li:nth-child(2)')).to have_content 'I am the first peep'
  end

  scenario 'I want to see the time and date of post' do
    Chitter.post_peep(peep: 'You can see the time', post_time: '12:00')

    visit('/chitter')
    expect(page).to have_content ('12:00')
  end
end

feature 'Posting a peep' do
  scenario 'I can post a peep in chitter' do
    Chitter.post_peep(peep: 'I am a posted peep', post_time: '12:00')

    visit('/chitter/post_peep')
    fill_in 'peep', with: 'I am a posted peep'
    click_button 'submit'
    expect(page).to have_content 'I am a posted peep'
  end
end
