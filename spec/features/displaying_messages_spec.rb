feature 'display messages' do
  scenario 'displays message, username, name and time' do
    allow(Time).to receive(:new).and_return("2009-06-24 12:39:54 +0900")
    create_post
    within 'ul#messages' do
      expect(page).to have_content('Hello world!')
      expect(page).to have_content("2009-06-24 12:39:54 +0900")
      expect(page).to have_content('Alice Wonder')
      expect(page).to have_content('nyancat')
    end
  end
end
