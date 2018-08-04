feature 'able to take in peep' do

  scenario 'prints out a peep' do
    visit '/'
    fill_in 'username', with: 'limcuili'
    click_button 'Go!'
    fill_in :peep, with: "This is my first peep!"
    click_button "Post!"
    expect(page).to have_content "This is my first peep!"
  end

end
