require 'active_record/migration'

class Golden::Menu::InstallGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)

  argument :name, type: :string, default: 'menu'

  def self.next_migration_number dirname
    next_migration_number = current_migration_number(dirname) + 1
    ActiveRecord::Migration.next_migration_number(next_migration_number)
  end

  def generate_migration
    %W(
      create_golden_menus.rb
      create_golden_menu_resources.rb
    ).each do |file|
      migration_template file, File.join('db/migrate', class_path, file)
    end
  end


  def generate_initializer
    file = 'golden_menu.rb'
    log :initializer, file
    template file, File.join('config/initializers', class_path, file), verbose: false
  end

  def add_locales_path
    file = 'config/application.rb'
    sentinel = "# config.i18n.default_locale = :de\n"
    insert_into_file file, after: sentinel do
      "    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]\n"
    end
  end

  def generate_locales
    files = %w{menus.en.yml menus.zh-TW.yml}
    files.each do |file|
      log :locales, "golden/#{file}"
      template file, File.join('config/locales/golden', class_path, file), verbose: false
    end
  end

  def inject_routes
    route "mount Golden::Menu::Engine, at: '/'\n"
  end

  def inject_controller
    file = 'app/controllers/application_controller.rb'
    sentinel = "protect_from_forgery with: :exception\n"
    insert_into_file file, after: sentinel do
      "  helper Golden::Menu::HierarchicalMenusHelper\n"
    end
  end

  def generate_helper
    file = 'menu_resources_helper.rb'
    log :helper, file
    template file, File.join('app/helpers/golden/menu', class_path, file), verbose: false
  end
end
