feature 'Post peeps:' do
  scenario 'user can type a message and it will be displayed' do
    visit '/peeps'
    fill_in 'new_peep', with: "posting my first peep"
    click_button 'Peep'
    expect(page).to have_content("posting my first peep")
  end
end
