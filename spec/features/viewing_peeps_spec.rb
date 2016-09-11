feature 'Viewing peeps' do
  scenario 'Users can see peeps on homepage without logging in' do
    Peep.create(title: 'Welcome to Chitter',
                posted_by: 'Chitter Team',
                created_at: Time.now.strftime('%c'),
                body: 'Join Chitter and start peeping your moments')

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Welcome to Chitter')
    end
  end
end
