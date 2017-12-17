feature "post new peeps" do

  scenario "I can post a new peep on Chitter" do
    visit('/peeps/new')
    fill_in('message', with: "Hello")
    click_button 'Post'
    expect(page).to have_content 'Peep: Hello'
  end
end
