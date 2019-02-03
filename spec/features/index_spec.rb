feature 'Viewing Peeps' do
  scenario 'visiting index page' do
    visit '/'
    expect(page).to have_title('Peeps')
  end
end
