class CreatePeep < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.string :body
      t.datetime :time_posted
    end
  end
end
