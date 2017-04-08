feature 'All peeps' do

  scenario 'Homepage should contain a list of all peeps' do
    sign_up
    sign_in
    Peep.create(message: 'Hello World')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content 'Hello World'
    end
  end
end
