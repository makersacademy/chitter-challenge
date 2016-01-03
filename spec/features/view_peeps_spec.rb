feature 'viewing peeps' do
  include SessionHelpers

  let(:content1) { "Some content here"}
  let(:content2) { "Some other stuff"}

  before do
    register
    Capybara.reset!
  end

  scenario 'in chronological order' do
    login
    add_peep(content: content1)
    add_peep(content: content2)
    expect(current_path).to eq '/peeps'
    peep = page.all("article.peep")
    expect(peep[0]).to have_content content1
    expect(peep[1]).to have_content content2
  end
end
