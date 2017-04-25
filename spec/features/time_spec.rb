require 'timecop'

feature 'Time' do

  let!(:user) do
    User.create(email: 'cat@cat.com',
                name: 'saucy cat',
                username: 'cat',
                password: 'cat',
                password_confirmation: 'cat')
  end

  scenario 'DateTime meow was sent will be displayed with meow' do
    Timecop.freeze(Time.new(2017, 4, 9, 13, 0, 0))
    visit '/sessions/new'
    sign_in(username: user.username, password: user.password)
    visit '/meows/new'
    fill_in(:message, with: 'Cat')
    click_button('Send meow!')
    expect(page).to have_content 'Sun, 09 Apr 2017 13:00'
  end

  scenario 'Meows will be listed in reverse chronological order' do
    Timecop.freeze(Time.new(2017, 4, 9, 13, 0, 0))
    visit '/sessions/new'
    sign_in(username: user.username, password: user.password)
    visit '/meows/new'
    fill_in(:message, with: 'Cat')
    click_button('Send meow!')

    Timecop.freeze(Time.new(2017, 4, 9, 11, 0, 0))
    visit '/meows/new'
    fill_in(:message, with: 'Saucy cat')
    click_button('Send meow!')

    expect(page).to have_selector('ul#meows li:nth-child(1)', text: 'Sun, 09 Apr 2017 13:00')
    expect(page).to have_selector('ul#meows li:nth-child(2)', text: 'Sun, 09 Apr 2017 11:00')
  end
end
