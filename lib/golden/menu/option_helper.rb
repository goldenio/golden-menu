module Golden
  module Menu
    class OptionHelper
      attr_accessor :menu_type
      attr_accessor :linked
      attr_accessor :options

      def initialize args
        @menu_type = args.delete(:menu_type) || []
        @linked = args.delete(:menu_linked)
        @linked = false if @linked.nil?
        @options = args
      end

      def menu_ul_class
        { class: 'nav' }.deep_merge options
      end

      def menu_li_class
        if menu_type.include? 'dropup'
          { class: 'dropup' }
        else
          { class: 'dropdown' }
        end
      end

      def submenu_li_class
        if menu_type.include? 'pull-left'
          { class: 'dropdown-submenu pull-left' }
        else
          { class: 'dropdown-submenu' }
        end
      end

      def linked?
        linked
      end
    end
  end
end

