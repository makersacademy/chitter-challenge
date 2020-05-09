feature 'index' do
  scenario 'displays testing framework' do
    visit('/')
    expect(page).to have_content('testing fraemwork working')
  end
end
