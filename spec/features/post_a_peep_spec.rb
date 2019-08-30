feature 'chitter page' do
  scenario 'post a new peep' do
    visit '/chitter'
    fill_in('message', with: "Hello from Mars!")
    click_button('post')

    expect(page).to have_content("Hello from Mars!")
  end
end
