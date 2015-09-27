require_relative '../factories/user'

feature 'creating peeps' do

  scenario 'User can only create a new peep when signed in' do
    user = create :user
    sign_in(user)
    create_peep('hello')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Peeper: Foo Bar foobar Peep: hello')
  end



end
