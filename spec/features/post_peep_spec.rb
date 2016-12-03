feature "post peep" do

  scenario "a user can post a new peep" do
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'This is my first peep!'
    click_button 'Post peep'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('This is my first peep!')
  end
end
