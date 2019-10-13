feature 'named peeps' do
  scenario 'new peep shows user name' do
    log_in_post_peep

    expect(page).to have_content "Guy @guy Seconds ago"
  end
end
