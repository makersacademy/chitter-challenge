feature 'add peeps' do
  scenario 'add peep button on the index page' do
    visit('/')
    expect(page).to have_button('Make Peep')
  end

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

  scenario 'added peep message appears on /peeps' do
    visit('/')
    click_button('Make Peep')
    fill_in('message', with: "Test")
    click_button('Post!')
    expect(page).to have_content("Test")
  end
end

def current_path
  URI.parse(current_url).path
end
