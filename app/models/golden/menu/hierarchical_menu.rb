class Golden::Menu::HierarchicalMenu < ActiveRecord::Base
  include ::TheSortableTree::Scopes

  self.table_name = 'golden_menus'

  attr_accessible :group, :name, :description, :parent_id, :resource_url

  validates :name, presence: true
  validates :url, format: { with: /\A([\w\-]{3,})\z/ }, allow_blank: true

  belongs_to :parent, class_name: 'Golden::Menu::HierarchicalMenu'
  has_many :menu_resources, foreign_key: 'menu_id'

  acts_as_url :name, sync_url: true, only_when_blank: true
  acts_as_nested_set

  class << self
    def grouped(name)
      where(group: name)
    end
  end

  def to_param
    id
  end

  def name_and_group
    return name unless translated_group
    "#{name} @#{translated_group}"
  end

  def translated_group
    ::Golden::Menu.translate_group group
  end
end
