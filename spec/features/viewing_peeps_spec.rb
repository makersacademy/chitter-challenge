feature 'Viewing peeps' do
  before(:each) do
    sign_up(email: 'pug@gmail.com', name: 'Pug', username: '@puggy',
     password: 'password', password_confirmation: 'password')

    log_in(email: 'pug@email.com', password: 'password')
    post_a_peep("Today is a great day!")
  end

  scenario 'I can view my peeps and the time it was sent' do
    expect(page.current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content "Today is a great day!"
      expect(page).to have_content "Posted at: #{Peep.first.created_at.strftime('%x')}"
    end
  end

  scenario 'peeps contain name and username' do
    expect(page).to have_content('Pug')
    expect(page).to have_content('@puggy')
  end
end
