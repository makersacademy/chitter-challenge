feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do

    user = create :user
    user.peeps.create(content: 'hello')
    visit '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('JD03: hello')
    end
  end
end
