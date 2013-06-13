class Golden::Menu::HierarchicalMenusController < ApplicationController
  include ::TheSortableTreeController::Rebuild

  before_filter :authenticate_session!
  load_and_authorize_resource :menu, class: 'Golden::Menu::HierarchicalMenu', parent: false #, find_by: :url

  def index
    @menu = @menus.nested_set.select('id, url, name, description, parent_id')
    respond_with @menus
  end

  def show
    respond_with @menu
  end

  def new
    respond_with @menu
  end

  def edit
  end

  def create
    @menu.save
    respond_with @menu
  end

  def update
    @menu.update_attributes params[:menu]
    respond_with @menu
  end

  def destroy
    @menu.destroy
    respond_with @menu
  end

  def list
    @menu = @menus.nested_set
    @menus = @menus.paginate page: params[:page]
  end

  protected

  def the_define_common_variables
    ['@menu', 'menus', Golden::Menu::HierarchicalMenu]
  end
end
