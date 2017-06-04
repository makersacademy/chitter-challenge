feature 'personal feed of user' do
  scenario 'user can see button to make new peep' do
    visit('/posts/all')
    click_button('New Peep')
    expect(current_path).to eq('/posts/new')
  end

  scenario 'posted peeps are time-stamped' do
    post_new_peep
    within 'ul#peeps' do
      expect(page).to have_content "#{Time.now.strftime("%d %b %Y %H:%M")} - Hello world!"
    end
  end
end
