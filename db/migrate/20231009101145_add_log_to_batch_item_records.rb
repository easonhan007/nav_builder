class AddLogToBatchItemRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :batch_item_records, :log, :text
  end
end
