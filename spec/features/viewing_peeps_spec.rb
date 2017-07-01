feature 'lists peeps' do
  scenario 'lists last added peep' do
    add_new_peep
    expect(page).to have_content('Happy it\'s saturday')
  end
  
  scenario 'lists all peeps in reverse chronological order' do
    add_new_peep
    add_another_peep
    
    expect('it\'s already sunday :( ...').to   appear_before('Happy it\'s saturday')
  end
  
  scenario 'lists the time the peep was added' do
    add_new_peep
    expect(page).to have_content(Time.now.strftime("%H:%M %a %d %b %y"))
  end
  
end
