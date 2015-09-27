require './spec/factories/user'

feature 'viewing peeps' do
  scenario 'peeps shown with username and name' do
    user = create :user
    visit 'session/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Log in'
    peep = build :peep
    visit '/peep/new'
    fill_in 'content', with: peep.content
    click_button 'Post'
    expect(page).to have_content user.username
    expect(page).to have_content user.name
  end

  scenario 'can view peeps in reverse chronological order' do
    user = create :user
    visit 'session/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Log in'
    peep1 = build :peep
    visit '/peep/new'
    fill_in 'content', with: peep1.content
    click_button 'Post'
    peep2 = build :peep
    click_link 'Create peep'
    fill_in 'content', with: peep2.content
    click_button 'Post'
    within '#peep0' do
      expect(page).to have_content peep2.content
    end
  end
end
