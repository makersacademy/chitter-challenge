feature "show peep" do
  scenario "user can see a peep" do
    visit('/peeps/new')
    fill_in('peep', with: 'HelloWorld')
    click_button('Post Peep')
    
    expect(page).to have_content("HelloWorld")
  end
end
