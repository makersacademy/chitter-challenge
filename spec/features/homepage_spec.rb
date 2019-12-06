feature 'Viewing homepage' do
  scenario 'Check the root route links to the homepage' do
    visit('/')
    expect(page).to have_content 'This is the homepage'
  end
end
