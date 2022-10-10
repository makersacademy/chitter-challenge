require 'maker'
require 'maker_manager'

describe MakerManager do
  it 'adds new maker' do
    manager = MakerManager.new
    new_maker1 = Maker.new('testingtesting@testing.com', 'password1', 'Testy Testface', 'TSTRS')
    new_maker2 = Maker.new('anothertester@makers.com', '1234', 'Secret Plant', 'hello world')
    manager.create(new_maker1)
    manager.create(new_maker2)

    expect(manager.all_makers).to include(new_maker1)
    expect(manager.all_makers).to include(new_maker2)
  end
end
