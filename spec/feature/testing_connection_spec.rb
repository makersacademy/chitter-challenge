feature 'testing connection' do
  scenario 'Able to see text on local host' do
    visit '/'
    expect(page).to have_content 'Hello Peeps!'
  end
end