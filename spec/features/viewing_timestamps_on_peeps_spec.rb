feature 'Viewing timestamps' do
  scenario 'A user can see timestamps for peeps' do
    Peep.create(peep_text: 'peeping away 🐥')
    time_now = Time.now.strftime "%Y-%m-%d %H:%M:%S"
    # Can't use timecop to freeze time?
    time_now_variance = (Time.now + 1).strftime "%Y-%m-%d %H:%M:%S"
    visit('/peeps')

    expect(page).to have_content("#{time_now} peeping away 🐥").or have_content("#{time_now_variance} peeping away 🐥")
  end

  scenario 'peeps are in reverse chronological order' do
    Peep.create(peep_text: 'This is a peep')
    Peep.create(peep_text: 'Peep peep!')
    Peep.create(peep_text: 'peeping away 🐥')

    visit('/peeps')

    expect(page.find('li:nth-child(1)')).to have_content 'peeping away 🐥'
    expect(page.find('li:nth-child(2)')).to have_content 'Peep peep!'
    expect(page.find('li:nth-child(3)')).to have_content 'This is a peep'
  end
end
