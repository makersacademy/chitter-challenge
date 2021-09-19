feature 'View own posts' do 
  scenario 'after signing up user can post and view posts' do 
    visit('/signup')
    fill_in :username, with: "Goku" 
    fill_in :peep, with: "I am the strongest saiyan"
    click_button("Submit")
    find('details').click
    fill_in :peep, with: "Did I say I can go Ultra Instinct" 
    click_button("Post")
    expect(page).to have_content "Did I say I can go Ultra Instinct"
  end 
end
