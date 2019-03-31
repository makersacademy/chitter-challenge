feature 'Post a peep' do
  scenario "User submitting a peep" do
    visit ('/chitter')
    fill_in('peep', with: 'My first peep')
    click_button "Submit"
    expect(current_path).to eq '/chitter'
    expect(page).to have_content 'My first peep'
  end
end 