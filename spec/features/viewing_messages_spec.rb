feature 'Viewing messages' do

  scenario 'I can see existing messages without signing in' do
    Message.create( peep: 'Hello world!',
                    name: 'Joe Giant',
                    username: 'jollygreengiant')

    visit '/messages'

    within 'ul#messages' do
      expect(page).to have_content('Hello world!')
    end
  end

  scenario 'peeps are displayed in reverse chronological order' do
    sign_up
    3.times do |x|
      post_tweep(message: "#{x + 1}")
    end
    expect(page).to have_selector("ul#messages li:nth-child(1)", text: '3')
    expect(page).to have_selector("ul#messages li:nth-child(2)", text: '2')
    expect(page).to have_selector("ul#messages li:nth-child(3)", text: '1')
  end
end
