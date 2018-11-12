feature 'Edit peeps' do
  # as a social media user
  # so that i can make changes to a previous peep
  # i want to edit a peep
  scenario 'A user can edit a peep' do

    peep = Peep.create(text: 'bananas are yellow')

    visit('/peeps')
    expect(page).to have_content('bananas are yellow')

    first('.peep').click_button('Edit')
    expect(current_path).to eq("/peeps/#{peep.id}/edit")

    fill_in('text', :with => "bananas are red")
    click_button("Submit")

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content("bananas are yellow")
    expect(page).to have_content("bananas are red")
  end

end
