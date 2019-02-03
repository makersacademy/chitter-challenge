feature 'Viewing Cheets' do
  scenario 'visiting index page' do
    visit '/'
    expect(page).to have_title('Cheets')
  end
end
