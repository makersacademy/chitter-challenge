class CreatePeepsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |peep|
      peep.belongs_to :user, index: true
      peep.string :content
      peep.datetime :created_at
    end
  end
end
