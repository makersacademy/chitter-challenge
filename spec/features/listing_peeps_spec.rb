feature 'listing peeps' do
  scenario 'user can see the list of peeps' do
    Peep.create(message: 'hello')
    visit '/'
    click_button 'PEEPS'
    expect(page).to have_content('hello')
  end
end

feature 'peeps are in reverse chronological order' do
  scenario 'user can see peeps in reverse chronological order' do
    time = Time.now
    Peep.create(message: 'number 1', time: time)
    Peep.create(message: 'number 2', time: time)
    visit '/peeps'
    expect(page).to have_content("number 2 Posted at: #{time.strftime("%Y-%m-%d %k:%M")} number 1 Posted at: #{time.strftime("%Y-%m-%d %k:%M")}")
  end
end

feature 'time of peep' do
  scenario 'user can see the time a peep was posted' do
    time = Time.now
    Peep.create(message: 'hello', time: time)
    visit '/peeps'
    expect(page).to have_content("hello Posted at: #{time.strftime("%Y-%m-%d %k:%M")}")
  end
end
