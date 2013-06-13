class Golden::Menu::MenuResource < ActiveRecord::Base
  self.table_name = 'golden_menu_resources'

  belongs_to :menu, class_name: 'Golden::Menu::HierarchicalMenu', foreign_key: 'menu_id'
  belongs_to :resource, polymorphic: true
end
