class CreatePeep < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |peep|
      peep.string :maker_id
      peep.text :content
      peep.timestamps
    end
  end
end
