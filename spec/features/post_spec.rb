# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature "post" do

  scenario "post page displays text box and post button" do
    visit ('/')
    click_on "Post a Peep"
    expect(current_path).to eq '/peeps/post'
    expect(page).to have_button 'POST'
  end 

  scenario "post a message/'peep'" do
    visit ('/')
    click_on "Post a Peep"
    fill_in "message", with: "My names Jeff"
    click_on "POST"
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "My names Jeff"
  end

end
