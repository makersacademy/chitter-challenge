feature 'adding peeps' do
  include SessionHelpers

  let(:content) { "Nel mezzo del cammin di nostra vita
                    mi ritrovai per una selva oscura,
                    ché la diritta via era smarrita.
                    Ahi quanto a dir qual era è cosa dura
                    esta selva selvaggia e aspra e forte
                    che nel pensier rinova la paura!"}
  let(:username) { "dante_alighieri" }

  before do
    register(username: username)
    Capybara.reset!
  end

  scenario 'when user is logged in' do
    login
    add_peep(content: content)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "#{content} by #{username}"
  end

  scenario 'is prevented when peep is empty' do
    login
    add_peep(content: '')
    expect(current_path).to eq '/peeps/add'
    expect(page).to have_content "Your peep can't be empty!"
  end
end
