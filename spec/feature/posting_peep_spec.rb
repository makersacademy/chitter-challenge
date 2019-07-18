
feature 'Posting a peep to chitter' do
  scenario "User's message is posted to the homepage" do
    visit('/peeps/new')
    fill_in('message', with: 'Hello, world')
    click_button('Submit')

    expect(page).to have_content 'Hello, world'
  end
end
    
