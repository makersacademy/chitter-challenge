feature 'Viewing Chits' do

  scenario 'I can see existing chits on the chits page' do
    Chit.create(text: 'This is a new message.')
    visit '/chits'
    expect(page.status_code).to eq 200
    within 'ul#chits' do
      expect(page).to have_content('This is a new message')
    end
  end
end
