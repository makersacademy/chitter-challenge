require './spec/factories/user'

feature 'viewing peeps' do
  scenario 'peeps shown with username and name' do
    user = create :user
    log_in user, user.password
    peep = build :peep
    create_peep peep
    expect(page).to have_content user.username
    expect(page).to have_content user.name
  end

  scenario 'can view peeps in reverse chronological order' do
    user = create :user
    log_in user, user.password
    peep1 = build :peep
    create_peep peep1
    peep2 = build :peep
    click_link 'Create peep'
    fill_in 'content', with: peep2.content
    click_button 'Post'
    within '#peep0' do
      expect(page).to have_content peep2.content
    end
  end
end
