feature 'add peeps' do
  scenario 'add peep button on the index page' do
    visit('/')
    expect(page).to have_button('Make Peep')
  end

  scenario 'click button links to /peep/new' do
    visit('/')
    click_button('Make Peep')
    expect(current_path).to eq('/peeps/new')
  end

  scenario 'textbox and submit present in /peep/new' do
    visit('/')
    click_button('Make Peep')
    expect(page).to have_css('#add_peep')
    expect(page).to have_css('#submit_peep')
  end

  scenario 'route sent to POST /peep' do
    visit('/')
    click_button('Make Peep')
    click_button('Post!')
    expect(current_path).to eq('/peeps')
  end

  scenario 'added peep message appears on top of /peeps' do
    Timecop.freeze(Time.new(2018, 9, 20, 15, 0, 0, 0))
    add_peep("Test")
    expect(page).to have_content("Test")
    expect(page).to have_content("Posted at 20-09-18 15:00")
  end
end
