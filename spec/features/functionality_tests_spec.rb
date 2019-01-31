feature '#Homepage' do
  scenario 'Loads the default homepage when taken to /' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature '#Add Peep' do
  scenario 'Adds a peep' do
    visit '/'
    fill_in('add_peep', with: 'Hello World!')
    click_button('Peep!')
    expect(page).to have_content "Hello World!"
  end
end
