feature 'Viewing Peeps' do
  scenario 'I can see all Peeps on the Index page' do

    Peep.create(peep: 'Hello Peeps', created_at: Time.now, username:'knowerlittle' )

    visit '/links'
      expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content 'Hello Peeps'
      expect(page).to have_content 'knowerlittle'
    end
  end
end
