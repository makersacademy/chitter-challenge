require './spec/web_helper.rb'

feature 'Post message' do

  scenario 'User is able to post a message to chitter' do

    post_a_message
    expect(page.status_code).to eq 200
    expect(page).to have_content 'peep'
  end

  scenario 'User is able to see messages in reverse chronological order' do
    post_multiple_message
    visit('/messages')
    first_idx = page.body.index('first message')
    second_idx = page.body.index('second message')
    expect(first_idx).to be > second_idx
  end

  scenario 'User can see the time at which the message was made' do
    post_a_message
    time = Timecop.freeze(Time.now)
    expect(page.status_code).to eq 200
    expect(page).to have_content time.strftime("Sent on %m/%d/%Y at %I:%M %p")
  end



end
