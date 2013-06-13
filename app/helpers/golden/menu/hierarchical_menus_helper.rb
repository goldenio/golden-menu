module Golden::Menu::HierarchicalMenusHelper
  # Submenu should not be shown but move to root instead if root menu has no
  # menu_resources at all.
  def golden_dropdown_menu menus, options = {}
    option_helper = Golden::Menu::OptionHelper.new options
    render_list option_helper.menu_ul_class do |li|
      yield li if block_given?
      menus.each do |menu|
        next unless menu.menu_resources.exists?
        uri = golden_menu_link menu, option_helper.linked?
        li << [
          dropdown_toggle(menu.name, uri, title: menu.description),
          dropdown_menu(role: 'menu') do |li2|
            golden_dropdown_content menu.menu_resources, li2
            golden_dropdown_submenu menu.children, li2, option_helper
          end,
          option_helper.menu_li_class
        ]
      end
    end
  end

  def golden_dropdown_submenu menus, li, option_helper
    menus.each_with_index do |submenu, index|
      next unless submenu.menu_resources.exists?
      uri = golden_menu_link submenu, option_helper.linked?
      li << [nil, { class: 'divider' }] if index == 0
      li << [
        link_to(submenu.name, uri, title: submenu.description),
        dropdown_menu do |li2|
          golden_dropdown_content submenu.menu_resources, li2
          golden_dropdown_submenu submenu.children, li2, option_helper
        end,
        option_helper.submenu_li_class
      ]
    end
  end

  def golden_dropdown_content menu_resources, li
    menu_resources.each do |menu_resource|
      link = golden_menu_resource_link menu_resource.resource
      li << link if link
    end
  end

  def golden_menu_link menu, linked = false
    return menu.resource_url if menu.resource_url.present?
    linked ? golden_menu.hierarchical_menu_path(menu) : '#'
  end

  def golden_menu_groups
    Golden::Menu.groups.map do |value|
      [Golden::Menu.translate_group(value), value]
    end
  end
end
