feature 'Peeps' do
  scenario 'posting a new peep' do
    sign_up
    post_a_peep
    within "ul#peeps" do
      expect(page).to have_content "This is a peep"
    end
  end

  scenario 'doesn\'t let post a peep if not logged in' do
    visit visit '/peeps/new'
    expect(page).not_to have_content "New Peep"
  end

  scenario 'peeps are showed in reverse chronological order' do
    sign_up
    post_a_peep(content: 'This is my FIRST peep')
    sleep(1)
    post_a_peep(content: 'This is my SECOND peep')
    sleep(1)
    post_a_peep(content: 'This is my THIRD peep')

    within 'ul#peeps' do
      expect(find(:li, 1).text).to have_content ('This is my THIRD peep')
      expect(find(:li, 2).text).to have_content ('This is my SECOND peep')
      expect(find(:li, 3).text).to have_content ('This is my FIRST peep')
    end
  end

  scenario 'each peep has its username and timestamp' do
    sign_up
    post_a_peep(content: 'This is my FIRST peep')
    peep = Peep.first(content: 'This is my FIRST peep')
    username = peep.user.username
    time = peep.created_at.strftime("%a %b %d  %H:%M:%S")
    expect(page).to have_content time
    expect(page).to have_content username
  end

  

end
