require 'web_helper'

feature 'view messages posted to chitter' do

  scenario 'view a message' do
    visit ('/')
    sign_up
    fill_in 'message', with: 'I love spam!'
    click_button 'Post'

    within 'ul#messages' do
      expect(page).to have_content('I love spam!')
    end
  end

  scenario 'view time of post' do
    visit ('/')
    sign_up
    fill_in 'message', with: 'I love spam!'
    click_button 'Post'

    within 'ul#messages' do
      t1 = "#{Time.now.strftime "%R"}"
     expect(page).to have_content "#{t1}"
    end
  end

  scenario 'view posts in revers chronological order' do
    visit '/'
    sign_up
    fill_in 'message', with: 'I love cats!'
    click_button 'Post'
    fill_in 'message', with: 'She hates dogs!'
    click_button 'Post'

    expect(page).to have_selector("ul#messages li:nth-child(1)", text: "She hates dogs!")
    expect(page).to have_selector("ul#messages li:nth-child(2)", text: "I love cats!")
  end
end
