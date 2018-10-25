feature 'as a user' do
  scenario 'i can post a cheet' do
    visit '/'
    fill_in('cheet', with: "My first tweet")
    click_button 'Submit'
    expect(page).to have_content "My first cheet"
  end
end
