require_relative '../factories/user'

feature 'Creating peeps' do
  let(:user){ create :user }

  scenario 'User can create a new peep when signed in' do
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
    sign_in(user)
    create_peep('hello')
    expect(page).to have_content(Time.new.strftime("%R"))
  end

end

feature 'Viewing Peeps' do
  let(:user){ create :user }
  before :each do
    sign_in user
    create_peep('hello there')
  end

  scenario 'I can see existing peeps on the Peeps page' do
    expect(page).to have_content 'hello there'
  end

  scenario 'I can see existing peeps without being signed in' do
    click_button 'Sign out'
    visit '/peeps'
    expect(page).to have_content 'hello there'
  end
end
