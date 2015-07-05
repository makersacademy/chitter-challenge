feature 'creating a peep' do
  scenario 'when signed in, I can make a peep' do
    sign_in
    visit '/peep/new'
    fill_in :peepinput, with: 'this is my first peep'
    click_on 'Send'
    expect(page).to have_content 'foobar_user: this is my first peep'
  end
end
