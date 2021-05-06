feature 'peeps have the name of the maker' do
  scenario 'User can post a peep and it shows their name' do

    sign_in
    fill_in(:peep, with: "Hello it's chrissy!")
    click_button 'Add a peep'
    expect(page).to have_content "Hello it's chrissy!"
    expect(page).to have_content "posted by Chrissy"
  end
end
