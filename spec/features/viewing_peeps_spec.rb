feature 'can see peeps' do
  doubles
  scenario 'user sees peeps displayed on homepage' do
    log_in(username: maker.username, password: maker.password)
    fill_in :text, with: 'First peep!'
    expect(page).to have_content 'First peep!'
  end

  scenario 'shows owner of peep' do
    log_in(username: maker.username, password: maker.password)
    fill_in :text, with: 'First peep!'
    click_button 'Peep!'
    expect(page).to have_content "#{maker.username} peeped"
  end
  scenario 'guest cannot peep' do
    visit '/'
    click_button "Read peeps as Guest"
    expect(page).not_to have_field 'What will you peep about today?'
  end
end
