feature "messaging" do
  scenario "can post a message" do
    sign_up
    fill_in(:new_peep, with: 'Hello, world!')
    click_button 'post'
    expect(page).to have_content 'Hello, world!'
    expect(page).to have_content 'Kenneth Barrett'
    expect(find_by_id(:right_side)).to have_content '@kennbarr'
  end
end
4
