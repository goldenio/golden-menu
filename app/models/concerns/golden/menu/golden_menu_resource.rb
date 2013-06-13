module Golden::Menu::GoldenMenuResource
  extend ActiveSupport::Concern
  included do
    attr_accessible :menu_ids
    has_many :menu_resources, class_name: 'Golden::Menu::MenuResource', as: :resource
    has_many :menus, class_name: 'Golden::Menu::HierarchicalMenu', through: :menu_resources
  end

  module ClassMethods
  end
end
