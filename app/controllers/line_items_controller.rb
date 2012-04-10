class LineItemsController < ApplicationController
  before_filter :lookup_line_item, :only => [:show, :edit, :destroy, :update]
  before_filter :lookup_order, :only => [:show, :edit, :destroy, :update]
  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def create
    LineItem.increment_or_create_line_item(params[:line_item])

    redirect_to root_url
  end

  def destroy
    LineItem.destroy(@line_item)
    redirect_to root_url
  end

  def edit
  end

  def update
    @line_item.update_attributes(params[:order])
    redirect_to line_item_path(@line_item)
  end

  private

  def lookup_line_item
    @line_item = LineItem.find(params[:id])
  end

  def lookup_order
    @line_item = LineItem.find(params[:id])
    @order = Order.find(@line_item.order_id)
  end
end