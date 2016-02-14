feature 'view messages posted to chitter' do

  scenario 'view a message' do
    Message.create(username:"Tim", text: "I love spam!", time: "#{Time.now.strftime "%R"}")
    visit ('/')
    expect(page.status_code).to eq 200

    within 'ul#messages' do
      expect(page).to have_content('I love spam!')
    end
  end

  scenario 'view time of post' do
    Message.create(username:"James", text: "I love cats!", time: t1 = "#{Time.now.strftime "%R"}")
    visit ('/')

    within 'ul#messages' do
     expect(page).to have_content "#{t1}"
    end
  end

  scenario 'view posts in revers chronological order' do
    Message.create(username:"James", text: "I love cats!", time: "#{Time.now.strftime "%R"}")
    Message.create(username:"James", text: "She hates dogs!", time: "#{Time.now.strftime "%R"}")
    visit ('/')

   expect(page).to have_selector("ul#messages li:nth-child(1)", text: "She hates dogs!")

  end
end
