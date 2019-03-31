# User story 1
# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Post a peep' do
  scenario "User posting a peep on chitter" do
    visit ('/chitter')
    fill_in("peep", with: 'My first peep')
    click_button "Submit"
    expect(current_path).to eq '/chitter'
    expect(page).to have_content 'My first peep'
  end
end 