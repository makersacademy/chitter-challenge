feature 'Viweing the peeps' do
  scenario 'visiting the Chitter index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
end
