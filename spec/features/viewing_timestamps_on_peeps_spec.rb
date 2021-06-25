feature 'Viewing timestamps' do
  scenario 'A user can see timestamps for peeps' do
    Peep.create(peep_text: 'peeping away 🐥')
    time_now = Time.now.strftime "%Y-%m-%d %H:%M:%S"
    # Can't use timecop to freeze time?
    time_now_variance = (Time.now + 1).strftime "%Y-%m-%d %H:%M:%S"
    visit('/peeps')

    expect(page).to have_content("#{time_now} peeping away 🐥").or have_content("#{time_now_variance} peeping away 🐥")
  end
end
