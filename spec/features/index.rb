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
end

def current_path
  URI.parse(current_url).path
end
