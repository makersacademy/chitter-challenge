feature 'New peep' do 
  scenario 'create a new post and see it on the page' do 
    visit('/feed')
    fill_in('peep', with: "Hello this is my first peep")
    click_button "Post"
    expect(page).to have_content "Hello this is my first peep"
  end
end