feature "Replying to a peep:" do

  scenario 'I can reply to a peep if I\'m logged in' do
    user = create :user
    log_in_as user
    peep = build :peep, user: user
    send_a_peep peep
    within 'div#peep_show' do
      expect(page).to have_content 'reply'
    end
  end

  scenario 'I can\'t reply to peeps without logging in' do
    user = create :user
    log_in_as user
    peep = build :peep, user: user
    send_a_peep peep
    click_button 'Log out'
    within 'div#peep_show' do
      expect(page).not_to have_content 'reply'
    end
  end

end
