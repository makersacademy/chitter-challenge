feature 'visiting the home page' do
  scenario 'see page title' do
    visit '/'
    expect(page).to have_content('Chitter')
  end
end
