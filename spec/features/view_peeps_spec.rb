feature 'viewing peeps' do

  let(:content1) { "Nel mezzo del cammin di nostra vita
                    mi ritrovai per una selva oscura,
                    ché la diritta via era smarrita.
                    Ahi quanto a dir qual era è cosa dura
                    esta selva selvaggia e aspra e forte
                    che nel pensier rinova la paura!"}
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
    within "article:nth-child(1)" do
      expect(page).to have_content content2
    end
    within "article:nth-child(2)" do
      expect(page).to have_content content1
    end
  end
end
