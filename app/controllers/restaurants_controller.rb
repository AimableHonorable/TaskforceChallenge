class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  # GET /restaurants
  # GET /restaurants.json
  def index
    @search = Restaurant.ransack(params[:q])
    if params[:q]
      @restaurants = @search.result(distinct: true).page(params[:page])
    else
      @restaurants = Restaurant.all.page(params[:page])
    end


  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @comments = @restaurant.comments
  @comment = @restaurant.comments.build
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    4.times {@restaurant.breakfasts.build}
    4.times {@restaurant.lunches.build}
  end

  # GET /restaurants/1/edit
  def edit
    1.times {@restaurant.breakfasts.build}
    1.times {@restaurant.lunches.build}
  end

  # POST /restaurants
  # POST /restaurants.json
  def create

    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

      if @restaurant.save
        redirect_to restaurants_path, notice: 'Restaurant was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:resto_name, :location, :website, :online_delivery, :table_booking, :image, :image_cache, breakfasts_attributes: [:id, :item, :price], lunches_attributes: [:id, :item, :price])
    end
end
