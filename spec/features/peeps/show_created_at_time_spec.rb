feature 'show created at time' do
  scenario 'show timestamp on new peep' do
    log_in_post_peep
    
    expect(page).to have_content "Seconds ago"
  end
end