feature 'Viewing homepage' do
  scenario 'visit index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
end
