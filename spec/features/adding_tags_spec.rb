feature 'Adding tags' do

  let(:user){create :user}

  scenario 'I can add a single tag to a new peep' do
    sign_in(handle: user.handle, password: user.password)
    visit '/peeps/new'
    fill_in 'post',   with: 'going to the rugby'
    fill_in 'tags',  with: 'fun'

    click_button 'Post peep'
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include('fun')
  end

  scenario 'I can add multiple tags to a new peep' do
    sign_in(handle: user.handle, password: user.password)
    visit '/peeps/new'
    fill_in 'post',   with: 'hello world'
    fill_in 'tags',  with: 'fun ruby'
    click_button 'Post peep'
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include('fun', 'ruby')
  end

end
