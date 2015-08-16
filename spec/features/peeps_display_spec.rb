feature 'viewing peeps on a page in order' do
  
  scenario 'peeps are displayed' do
    user = create :user
    sign_in(user)
    peep = build :peep
    post(peep)
    expect(page).to have_content('The first peep')
  end
end