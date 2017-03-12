# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "post" do
  scenario "user can add a new peep" do
    sign_in
    fill_in 'new_peep', with: 'First peep'
    click_button 'Add'
    expect(page).to have_content "First peep"
  end

  scenario "user can add and see multiple peeps" do
    sign_in
    fill_in 'new_peep', with: 'First peep'
    click_button 'Add'
    fill_in 'new_peep', with: 'Second peep'
    click_button 'Add'
    peeps = Peep.all
    expect(peeps.count).to eq 2
  end
end
