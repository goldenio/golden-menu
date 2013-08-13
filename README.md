# Golden::Menu

The `golden-menu` creates menus by building a hierarchiacal tree first and linking related resources later.

## Requirement

For Rails 4 project, `Gemfile` should have

```ruby
gem 'devise', '> 3.0'
gem 'cancan'
gem 'simple_form', '~> 3.0.0.rc'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails'
gem 'will_paginate'
gem 'rails-theme-helper'
```

For Rails 3 project, `Gemfile` should have

```ruby
gem 'devise', '>= 2.0', '< 3.0'
gem 'cancan'
gem 'simple_form', '>= 2.0', '< 3.0'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails'
gem 'will_paginate'
gem 'rails-theme-helper'
```

Please make sure these gems are installed and configured properly.

## Installation

Add `golden-menu` to your application's Gemfile.

```ruby
gem 'golden-menu'
```

Then bundle gems, generate files and migrate database.

```ruby
$ bundle
$ rails generate golden:menu:install
$ rake db:migrate
```

Remember add menu abilities for `cancan`.

```ruby
can :manage, Golden::Menu::HierarchicalMenu
```

## Configuration

You will need to add these basic configures of `golden-menu` for your needs.

* `groups` for grouping menus with a name
* `translate_group_block` for group name translation

Edit `config/initializers/golden_menu.rb` for more detail.

## Usage

Please go to `/hierarchical_menus` and create the needed menu tree first.

### Menu Navigation

You can simply add a `golden_dropdown_menu` to your view of main app

```ruby
<%= golden_dropdown_menu Golden::Menu::HierarchicalMenu.grouped('header').roots %>
```

Or with more options and list items

```ruby
<%= golden_dropdown_menu Golden::Menu::HierarchicalMenu.grouped('sidebar').roots, {
  menu_type: %w{pull-left},
  class: 'nav nav-list',
  role: 'side-navigation'
} do |li|
  li << [t('.title'), class: 'nav-header']
  li << link_to(t('.guides'), guides_path)
  pages.each do |page|
    li << link_to(page.title, page_path(page))
  end
end %>
```

### Menu resources

You can add the menu association field to form parital of any classes.

```ruby
<%= f.association :menus,
  collection: nested_set_options(Golden::Menu::HierarchicalMenu) { |menu|
    "#{'-' * menu.level} #{menu.name_and_group} (#{menu.menu_resources.count})"
  },
  input_html: {
    multiple: true,
    class: 'chzn-select'
  } %>
```

Edit `menu_resources_helper.rb` and define what resource the menu item represented.

```ruby
def golden_menu_resource_link resource
  case resource
  when Page
    link_to resource.title, page_path(resource)
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT

