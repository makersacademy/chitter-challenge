feature 'Viewing homepage' do
  scenario 'Check the root route links to the homepage and shows a list of peeps' do
    visit('/')
    expect(page).to have_content 'This is a new peep'
  end
end
