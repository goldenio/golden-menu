class CreateGoldenMenuResources < ActiveRecord::Migration
  def change
    create_table :golden_menu_resources do |t|
      t.references :menu
      t.references :resource, polymorphic: true

      t.timestamps
    end
    add_index :golden_menu_resources, :menu_id
    add_index :golden_menu_resources, [:resource_type, :resource_id]
  end
end
