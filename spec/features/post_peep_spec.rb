
feature "post peep" do

  scenario "a user can post a new peep" do
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'This is my first peep!'
    click_button 'Post peep'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('This is my first peep!')
    expect(page).to have_content('=> test')
  end

  scenario "a user tries to peep while signed out" do
    visit '/peeps/new'
    expect(page).to have_content('Sign in to post a peep!')
    expect(page).not_to have_content('Post a new peep')
  end
end
