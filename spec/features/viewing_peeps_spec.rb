
feature 'peeps' do
  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'content', with: "Hey! I'm leaving a peep!"
    click_button 'send'
    expect(page).to have_content "Hey! I'm leaving a peep!"
  end

  scenario "I can view a list of previous peeps" do
    visit '/peeps/new'
    fill_in 'content', with: "This is another peep!"
    click_button 'send'
    visit '/peeps/new'
    fill_in 'content', with: "...and another one!"
    click_button 'send'
    expect(page).to have_content "This is another peep!"
    expect(page).to have_content "...and another one!"
  end
end
