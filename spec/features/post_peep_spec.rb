feature "Post peep" do

  scenario "a user can post a new peep" do
    visit '/peeps/new'
    fill_in 'content', with: 'This is my first peep!'
    fill_in 'user_id', with: 'Test name'
    click_button 'Post'

    expect(current_path).to eq '/peeps'
    # expect(page).to have_content('Test name')
    expect(page).to have_content('This is my first peep!')
  end
end