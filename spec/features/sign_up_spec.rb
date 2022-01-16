feature 'user can sign up' do
  scenario 'user can sign up so their peeps have thier name' do
    visit('/peeps')

    click_on 'Sign up'

    fill_in 'username', with: 'Pingu'
    click_on 'Register'

    fill_in 'message', with: 'peep peep'
    click_on 'Post'

    expect(page).to have_content 'Pingu'
  end

end