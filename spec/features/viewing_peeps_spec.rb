feature 'Viewing peeps' do
  scenario 'I can see peeps people have posted on the peeps page' do
    log_in_post_peep
    click_button 'Log out'
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content("My first peep")
    end
  end
end
