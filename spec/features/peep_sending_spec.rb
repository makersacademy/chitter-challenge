feature 'Sending peeps:' do

  scenario 'I can\'t peep without logging in' do
    visit '/'
    expect(page).not_to have_button('Peep')
  end

  scenario 'I can log in and send a peep' do
    user = create :user
    log_in_as(user)
    peep = build :peep
    send_a_peep(peep)
    within 'div#peep_show' do
      expect(page).to have_content(peep.message)
    end
  end

  scenario 'Peeps I send are tagged as mine' do
    user = create :user
    log_in_as(user)
    peep = build :peep
    send_a_peep(peep)
    within 'div#peep_show' do
      expect(page).to have_content(user.handle)
    end
  end

  scenario 'I can\'t peep a blank message' do
    user = create :user
    log_in_as(user)
    expect{click_button 'Peep'}.not_to change(Peep, :count)
  end

end
