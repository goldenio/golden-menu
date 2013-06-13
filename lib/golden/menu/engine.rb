module Golden
  module Menu
    class Engine < ::Rails::Engine
      isolate_namespace Golden::Menu
      engine_name :golden_menu

      config.autoload_paths += [
        root.join('app', 'models', 'concerns').to_s
      ]
    end
  end
end
