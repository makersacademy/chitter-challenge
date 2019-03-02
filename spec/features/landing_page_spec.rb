feature 'Initializing app' do

  scenario 'visits landing page' do
    visit '/'
    expect(page).to have_content("Welcome to Chitter")
  end

end
