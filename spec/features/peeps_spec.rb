require_relative '../factories/user'

feature 'Creating peeps' do

  scenario 'User can create a new peep when signed in' do
    user = create :user
    sign_in(user)
    create_peep('hello')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content 'Peeper: Foo Bar foobar'
    expect(page).to have_content 'Peep: hello'
  end

  scenario 'user cannot peep unless signed in' do
    visit '/peeps/new'
    expect(current_path).to eq('/peeps')
    expect(page).to have_content 'Sign in or sign up to peep!'
  end

  scenario 'The peeps have a time of when it was peeped' do
    user = create :user
    sign_in(user)
    create_peep('hello')
    expect(page).to have_content(Time.new)
  end

end

feature 'Viewing Peeps' do

  scenario 'I can see existing peeps on the Peeps page' do
    user = create :user
    sign_in(user)
    create_peep('hello there')
    expect(page).to have_content 'hello there'
  end

  scenario 'I can see existing peeps without being signed in' do
    user = create :user
    sign_in(user)
    create_peep('hello there')
    click_button 'Sign out'
    visit '/peeps'
    expect(page).to have_content 'hello there'
  end

end
