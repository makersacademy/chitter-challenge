feature 'create message' do
  scenario 'create new post' do
    create_post
    within 'ul#messages' do
      expect(page).to have_content('Hello world!')
    end
  end
end
