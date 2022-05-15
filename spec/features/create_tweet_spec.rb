feature 'creating a peep' do
  scenario 'user can add tweets to the feed' do
    visit('/home')
    click_on 'Create Peep'
    fill_in 'new_peep', with: "IF THE ZOO BANS ME FOR HOLLERING AT THE ANIMALS I WILL FACE GOD AND WALK BACKWARDS INTO HELL"
    click_on 'Submit'
    expect(page).to have_content "IF THE ZOO BANS ME FOR HOLLERING AT THE ANIMALS I WILL FACE GOD AND WALK BACKWARDS INTO HELL"
  end
end
