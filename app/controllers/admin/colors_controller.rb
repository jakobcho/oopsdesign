class Admin::ColorsController < AdminController


  def index
    @colors = Color.all
  end

  def create 
    @color = Color.new(color_params)

    if @color.save
      redirect_to admin_colors_path
    else
      x
      render :new
    end
  end

  def new
    @color = Color.new
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])

    if @color.update(color_params)
      redirect_to admin_colors_path
    else
      X 
      render :edit
    end
  end

  private 

  def color_params
    params.require(:color).permit(:name, :color_code)
  end
end
