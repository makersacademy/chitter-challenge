
feature 'Posting messages(peeps)' do

  scenario 'when signed in I can post a new peep' do
    user = create :user
    post_peep(user, 'test peep')
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("#{user_yana} posted: test peep")
    end
  end

  scenario 'when not signed in I can not post a new peep' do
    visit '/peeps/new'
    expect(page).not_to have_button 'New peep'
    expect(page).to have_content 'Please sign in or sign up'
    expect(page).to have_button 'Sign in'
    expect(page).to have_button 'Sign up'
  end

  scenario 'when not signed in can click button to sign in' do
    visit '/peeps/new'
    click_button 'Sign in'
    expect(current_path).to eq '/sessions/new'
  end

  scenario 'when not signed in can click button to sign up' do
    visit '/peeps/new'
    click_button 'Sign up'
    expect(current_path).to eq '/users/new'
  end

  scenario 'post appear in reverse chronological order' do
    user = create :user
    post_peep(user, 'test1')
    post_peep(user, 'test2')
    click_button 'Sign out'
    visit '/peeps'
    expect(page).to have_content("#{time} #{user_yana} posted: test2 #{time} #{user_yana} posted: test1")
  end

  scenario 'I can see a time at which peep was made' do
    user = create :user
    post_peep(user, 'test time')
    expect(page).to have_content("#{time} #{user_yana} posted: test time")
  end

end
