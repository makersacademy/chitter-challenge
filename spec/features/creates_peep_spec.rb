feature 'peeps' do

  scenario "should create a new peep and redirect" do
    visit '/chitter'
    fill_in('peep', with: 'This is my peep')
    click_button('Post Peep')
    expect(page).to have_content "This is my peep"
  end
end
