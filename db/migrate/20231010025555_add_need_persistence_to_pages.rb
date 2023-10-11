class AddNeedPersistenceToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :need_persistence, :boolean, default: true
  end
end
