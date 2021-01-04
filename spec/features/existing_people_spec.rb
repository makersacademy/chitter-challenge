feature '#see people' do 
  scenario 'view a list of existing people' do
    visit('/new')
    fill_in('body', with: "Example cheet")
    click_button "Post"
    expect(page).to have_content "Example cheet"
  end
end