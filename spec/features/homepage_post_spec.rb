
feature 'Post message' do
  scenario "fill in box with message and post it on page" do
    visit('/homepage')
    fill_in'what', with: 'I am cleaning my house'
    click_on('post')
    expect(page).to have_content('I am cleaning my house')
  end

end
