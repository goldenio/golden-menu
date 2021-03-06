require 'awesome_nested_set'
require 'the_sortable_tree'

module Golden
  module Menu
    mattr_accessor :groups
    @@groups = []

    mattr_accessor :translate_group_block
    @@translate_group_block = lambda { |group|
      I18n.t(group, scope: 'golden.menu.groups')
    }

    mattr_accessor :permitted_fields
    @@permitted_fields = [
      :group, :name, :description, :parent_id, :resource_url
    ]

    mattr_accessor :hierarchical_menu_modules
    @@hierarchical_menu_modules = [
    ]

    def self.configure
      yield self
    end

    def self.translate_group group
      return if group.blank?
      @@translate_group_block.call group
    end
  end
end

require 'golden/menu/version'
require 'golden/menu/option_helper'
require 'golden/menu/engine'
