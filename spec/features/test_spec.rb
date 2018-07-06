feature 'test' do
  scenario 'shows message' do
    visit '/'

    expect(page).to have_content('Hello world')
  end
end
