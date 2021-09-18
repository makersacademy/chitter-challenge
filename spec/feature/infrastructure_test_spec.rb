feature 'Visiting the home page' do
  scenario 'it has text in it' do
    visit '/'
    expect(page).to have_content 'Hello world'
  end
end