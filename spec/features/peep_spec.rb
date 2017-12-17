feature 'Messages' do

  scenario 'users can send peeps' do
    signup
    signin
    send_peep('Hello World!')
    expect(page).to have_content 'Hello World!'
  end

  scenario 'peeps can only be sent by signed in users' do
    visit '/chat'
    send_peep('I am not signed in')
    expect(page).to_not have_content 'I am not signed in'
    expect(page).to have_content "If you wanna get peepin' you need to Sign In"
  end

  scenario 'peeps are displayed in reverse chronological order' do
    signup
    send_peep('Hello World!')
    send_peep('Goodbye Cruel World!')
    expect('Hello World!').to appear_before 'Goodbye Cruel World!'
  end

  scenario 'peeps are timestamped' do
    time = Time.now
    signup
    send_peep('Hello World!')
    expect(page).to have_content time.strftime("%b %e, %l:%M %p")
  end

end
