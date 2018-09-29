feature 'Homepage greets user' do
  scenario 'Homepage says hello' do
    visit ('/')
    expect(page).to have_content('Hello')
  end
end
