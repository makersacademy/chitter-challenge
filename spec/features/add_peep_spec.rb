feature 'add peeps' do
  scenario 'textbox and submit present in /peeps if logged in' do
    register
    expect(page).to have_css('#add_peep')
    expect(page).to have_css('#submit_peep')
  end

  scenario 'textbox and submit not present in /peeps if not logged in' do
    visit('/')
    expect(page).not_to have_css('#add_peep')
    expect(page).not_to have_css('#submit_peep')
  end

  scenario 'route sent to POST /peep' do
    register
    click_button('Post!')
    expect(current_path).to eq('/peeps')
  end

  scenario 'no peep added if text is empty' do
    register
    add_peep("")
    expect(page).not_to have_selector('.peep')
  end

  scenario 'added peep message appears on top of /peeps' do
    Timecop.freeze(Time.new(2018, 9, 20, 15, 0, 0, 0))
    register
    add_peep("Test")
    expect(page).to have_content("Test")
    expect(page).to have_content("Posted at 20-09-18 15:00")
  end
end
