feature 'peeping' do
  scenario 'user can post a peep on chitter' do
    visit '/peeps/new'
    fill_in('peep', with: "Let's learn about databases!")
    click_button('Peep')
    expect(page).to have_content("Let's learn about databases!")
  end
end
