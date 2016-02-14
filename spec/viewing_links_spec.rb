feature 'Viewing chits' do

  scenario 'I can see existing chits on the Chitter page' do
    Chit.create(user: 'Ninja', chitter_post: 'ZEF TO DEF')

    visit '/chits'
    expect(page.status_code).to eq 200

    within 'ul#posts' do
      expect(page).to have_content('ZEF TO DEF')
    end
  end
end