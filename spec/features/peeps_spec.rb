feature 'peeps' do

  let(:user) { user = create(:user) }

  scenario 'viewing a list of peeps' do
    sign_in(user)
    add_peep
    expect(page).to have_content('Ouch! My head hurts')
  end
end
