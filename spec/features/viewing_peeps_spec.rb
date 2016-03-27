feature 'can see peeps' do
  doubles
  scenario 'peeps displayed on homepage' do
    log_in(username: maker.username, password: maker.password)
    fill_in :text, with: 'First peep!'
    expect{click_button 'Peep!'}.to change{ Peep.count }.by 1
    expect(page).to have_content 'First peep!'
  end
end
