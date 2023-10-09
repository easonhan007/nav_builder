class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
