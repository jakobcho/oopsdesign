class Admin::ProductSkusController < AdminController
  before_action :find_product
  def index
    @products = ProductSku.all
  end

  def create 
    #local_params = product_sku_params 
    #color_code = Color.find(local_params[:color_id]).color_code

    #local_params[:sku] = "#{params[:product_sku][:pid]}-#{Date.today.year.to_s[2..3]}#{Date.today.month.to_s.rjust(2,'0')}-#{color_code}#{product_sku_params[:size]}"
    #@product_sku = ProductSku.new(local_params)

    #if @product_sku.save
    #  redirect_to admin_products_path
    #else
    #  render :new
    #end
    ###################################

    @product = Product.find(params[:product_id])
    f_params = product_params
    f_params[:product_skus_attributes].each do |item|
      color_code = Color.find(item[1][:color_id].to_i).color_code
      f_params[:product_skus_attributes][item[0]][:sku] = "#{params[:product][:pid]}-#{Date.today.year.to_s[2..3]}#{Date.today.month.to_s.rjust(2,'0')}-#{color_code}#{item[1][:size]}"    
    end

    if @product.update(f_params)
      redirect_to admin_product_path(@product)
    else
      render :new
    end


  end

  def new
    @product_sku = ProductSku.new
  end

  def edit
    @product_sku = ProductSku.find(params[:id])
  end

  def update
    @product_sku = ProductSku.find(params[:product_id])

    if @product_sku.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  private 

  def find_product
    @product_id = params[:product_id]
    redirect_to fixedassets_url unless @product_id
    @product = Product.find(@product_id)
  end


  def product_sku_params
    params.require(:product_sku).permit(:product_id, :sku, :size, :color_id, :quantity, :username)
  end

  def product_params
    params.require(:product).permit(:title, :description, :pid, :price, 
      product_skus_attributes: [:id, :sku, :size, :color_id, :username, :quantity, :_destroy],
      product_colors_attributes: [:id, :color_id, :_destroy],
      photos_attributes: [:image])
  end
end
