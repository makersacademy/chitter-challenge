feature "post new peeps" do

  scenario "User can post a new peep on Chitter" do
    sign_up
    visit('/peeps/new')
    fill_in('message', with: "Hello")
    click_button 'Post'
    expect(page).to have_content 'Peep: Hello'
  end

  scenario "User cannot post a new peep on Chitter when not signed in" do
    visit('/peeps/new')
    fill_in('message', with: "Hello")
    click_button 'Post'
    expect(page).to have_content 'Must sign in first'
  end

end
