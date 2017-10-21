feature 'display chits' do

  scenario 'see a chit that has been posted' do
    # binding.pry
    Chit.create(words: 'I really like cheese')
    visit ('/')

    expect(page.status_code).to eq 200

    within 'ul#chits' do
      expect(page).to have_content 'I really like cheese'
    end
  end
end
