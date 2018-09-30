feature 'main page' do
  scenario 'Title is set to Chitter' do
    visit('/')
    expect(title).to have_content('Chitter')
  end
  scenario 'Header is set to Chitter' do
    visit('/')
    expect(page).to have_content('Chitter')
  end

  scenario 'Root defaults to /peeps' do
    visit('/')
    expect(current_path).to eq('/peeps')
  end

  scenario 'peeps are shown in reverse chronological order' do
    register
    ["1", "2", "3"].each { |message| add_peep(message) }
    expect(page.find_by_id(0)).to have_content('3')
    expect(page.find_by_id(1)).to have_content('2')
    expect(page.find_by_id(2)).to have_content('1')
  end
end
