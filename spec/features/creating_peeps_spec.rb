feature 'Creating peeps' do
  scenario 'I can create peeps' do
    visit '/peeps/new'
    fill_in 'content', with: 'Que sera sera'
    click_button 'Chitter'
    expect(page).to have_content 'Que sera sera'
  end
end
