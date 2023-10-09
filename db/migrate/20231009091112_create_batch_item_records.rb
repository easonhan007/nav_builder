class CreateBatchItemRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :batch_item_records do |t|
      t.references :section, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
