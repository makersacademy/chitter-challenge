feature 'peeps' do

  scenario "should create a new peep and redirect" do
    visit '/chitter'
    fill_in('peep', with: 'This is my peep')
    click_button('Post Peep')
    visit '/chitter'
    fill_in('peep', with: 'This is my new peep')
    click_button('Post Peep')
    visit '/chitter'
    fill_in('peep', with: 'And here is a third peep')
    click_button('Post Peep')
    expect(page).to have_content "And here is a third peep This is my new peep This is my peep"
  end
end
