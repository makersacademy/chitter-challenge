feature 'Viewing peeps' do
  scenario 'peeps are shown on the home page' do
    Peep.post('This is a test peep!')
    visit '/'
    expect(page).to have_content 'This is a test peep!'
  end
end
