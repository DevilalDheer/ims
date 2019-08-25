class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show]
  def index
  	@warehouses = Warehouse.all
    @products = Product.includes(warehouse_products: :warehouse)
  end

  def edit
    @product.warehouse_products
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :sku_code, :price,
      :warehouse_products_attributes => [:item_count, :low_item_threshold, :id])
  end

end