feature 'peep appearing on page' do
  scenario 'when a peep is made' do
    Peep.create(name: 'Hello World!')
    Tag.create(name: 'greeting,message' )
    visit '/'
    fill_in :post, with: 'Hello World!'
    fill_in :tags, with: 'greeting,message'
    click_button 'Post Peep'
    expect(page).to have_content('Hello World!')
    expect(page).to have_content('greeting', 'message')
  end
end
