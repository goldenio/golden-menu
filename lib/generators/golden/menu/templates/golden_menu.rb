Golden::Menu.configure do |config|
  # Add avaiable groups with array of name and value.
  # Name will be used as translation key.
  # Default is a blank array. You SHOULD give one at least.
  config.groups = %w{header sidebar}

  # You can overwrite translated group names by changing the block definition.
  #config.translate_group_block = lambda do |group|
  #  I18n.t(group, scope: 'golden.menu.groups')
  #end

  # Add more allowed fields for strong paramters.
  #config.permitted_fields += []
end
