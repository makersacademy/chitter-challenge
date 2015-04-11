feature 'Viewing peeps' do

  before(:each) do
    add_peep
  end

  scenario 'on the homepage' do
    visit '/'
    expect(page).to have_content('test')
  end

  # 'be able to see all peeps on the homepage'
  # 'peeps should be in reverse cronological order'
end

def add_peep content = 'test'
  post = Peep.create(content: content, time: Time.now)
  p post.saved?
end