class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def create 
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  private 

  def product_params
    params.require(:product).permit(:title, :description, :pid, :price, 
      product_skus_attributes: [:id, :sku, :size, :color, :quantity, :_destroy],
      product_colors_attributes: [:id, :color_id, :_destroy],
      photos_attributes: [:image])
  end

end
