feature 'viewing messages' do
  scenario 'on the page' do
    visit '/messages'
    expect(page).to have_content('Hello World!')
  end
end