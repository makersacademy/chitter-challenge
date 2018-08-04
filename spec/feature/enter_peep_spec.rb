feature 'able to take in peep' do

  scenario 'prints out a peep' do
    insert_username_and_go
    fill_in :peep, with: "This is my first peep!"
    click_button "Post!"
    expect(page).to have_content "This is my first peep!"
  end

  scenario 'prints out two peeps' do
    insert_username_and_go
    fill_in :peep, with: "This is my first peep!"
    click_button "Post!"
    fill_in :peep, with: "Now I can add multiple peeps!"
    click_button "Post!"
    expect(page).to have_content "This is my first peep!"
    expect(page).to have_content "Now I can add multiple peeps!"
  end

end
