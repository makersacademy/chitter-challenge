shared_examples_for "require 'dm-transactions'" do

  %w[ Repository Model Resource ].each do |name|
    it "should include the transaction api in DataMapper::#{name}" do
      (DataMapper.const_get(name) < DataMapper::Transaction.const_get(name)).should be(true)
    end
  end

  it "should include the transaction api into the adapter" do
    @adapter.respond_to?(:push_transaction   ).should be(true)
    @adapter.respond_to?(:pop_transaction    ).should be(true)
    @adapter.respond_to?(:current_transaction).should be(true)
  end

end
