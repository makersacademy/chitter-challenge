feature 'lists peeps' do
  scenario 'lists last added peep' do
    add_new_peep('Happy it\'s saturday')
    expect(page).to have_content('Happy it\'s saturday')
  end
  
  scenario 'lists all peeps in reverse chronological order' do
    add_new_peep("Tom")
    add_new_peep("Jerry")
    expect('Jerry').to appear_before('Tom')
  end
  
  scenario 'lists the time the peep was added' do
    add_new_peep('Tom')
    expect(page).to have_content(Time.now.strftime("%H:%M %a %d %b %y"))
  end
  
end
