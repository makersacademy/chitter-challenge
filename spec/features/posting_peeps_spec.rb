feature 'Posting peeps' do
  scenario 'User can post and view their peeps' do
    sign_up
    click_button('New Peep')

    expect(current_path).to eq '/chitter/peep/new'

    fill_in :peep, with: "My first peep!"
    click_button "Post Peep"

    expect(page).to have_content "My first peep!"
  end

  scenario 'User can post peeps containing apostrophes' do
    sign_up
    click_button('New Peep')
    fill_in :peep, with: "just checkin' these apostrophes are working"
    click_button "Post Peep"

    expect(page).to have_content "just checkin' these apostrophes are working"
  end
end
