feature 'personal feed of user' do
  scenario 'user can see button to make new peep' do
    sign_up
    click_button('New Peep')
    expect(current_path).to eq('/posts/new')
  end

  scenario 'posted peeps are time-stamped' do
    sign_up
    post_new_peep
    within 'ul#peeps' do
      expect(page).to have_content "#{Time.now.strftime("%d %b %Y %H:%M")} - Hello world!"
    end
  end

  scenario 'posted peeps are user-stamped' do
    sign_up
    post_new_peep
    within 'ul#peeps' do
      expect(page).to have_content "Hello world! - Kavita"
    end
  end


end
