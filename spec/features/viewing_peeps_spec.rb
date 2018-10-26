feature 'Viewing peeps' do
  scenario 'peeps are shown on the home page' do
    visit '/'
    expect(page).to have_content 'This is a test peep!'
  end
end
