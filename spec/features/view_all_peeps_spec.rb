feature "viewing peeps" do
  scenario "users can create a peep" do
    visit('/')
    fill_in('username', with: 'leoncross')
    fill_in('name', with: 'leon')
    fill_in('message', with: 'My very first peep!!!')
    click_button 'Submit'
    expect(page).to have_content 'My very first peep!!!'
  end
end
