require 'pry'

feature 'bottle' do

  scenario 'user must be signed in to put a message in a bottle' do
    visit '/bottle/new'
    expect(current_path).to eq('/user/new')
    expect(page).to have_content('You need a bottle to send your message.')
  end
  scenario 'create new bottle' do
    sign_up
    sign_in(email: 'b@ttle.com', password: 'password')
    create_message_bottle
    expect { create_message_bottle }.to change(Bottle, :count).by(1)
    expect(current_path).to eq '/stream'
    expect(page).to have_content 'Will anyone ever read this?'
  end

    before do
      test_time = Time.local(2001, 4, 1, 12, 42)
      Timecop.travel(test_time)
    end

  scenario 'check message post time is displayed' do
    sign_up
    sign_in(email: 'b@ttle.com', password: 'password')
    create_message_bottle
    expect(page).to have_content("12:42")
  end

  scenario 'check messages are posted in reverse chronological order' do
    sign_up
    sign_in(email: 'b@ttle.com', password: 'password')
    create_message_bottle
    Timecop.travel(30)
    create_another_message_bottle
    expect(first(:css, '.message')).to have_content('I read it!')
    Timecop.travel(30)
    create_third_message_bottle
    expect(first(:css, '.message')).to have_content('So did I!')

  end

    after do
      Timecop.return
    end
end
