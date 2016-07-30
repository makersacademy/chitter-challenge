feature 'Viewing messages' do

  scenario 'I can see messages on the homepage' do
    Message.create(message: "Hello")
    visit '/'
    expect(page.status_code).to eq 200
    within 'ul#messages' do
      expect(page).to have_content("Hello")
    end
  end
end
