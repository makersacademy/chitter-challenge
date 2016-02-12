feature 'view messages posted to chitter' do

  scenario 'view a message' do
    Message.create(username:"Tim", text: "I love spam!", time: "#{Time.now.strftime "%R"}")
    visit ('/')
    expect(page.status_code).to eq 200

    within 'ul#messages' do
      expect(page).to have_content('I love spam!')
    end
  end
end
