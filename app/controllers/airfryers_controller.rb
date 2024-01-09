class AirfryersController < ApplicationController
  before_action :set_airfryer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :hashtags]

  # GET /airfryers or /airfryers.json
  def index
    @airfryers = Airfryer.all.order("created_at DESC")
  end

  # GET /airfryers/1 or /airfryers/1.json
  def show
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @airfryers = tag.airfryers
  end

  # def new
  #   # @airfryer = Airfryer.new
  #   @airfryer = current_user.airfryers.build
  # end

  def import_data(xlsx_path)
    xlsx = Roo::Spreadsheet.open(xlsx_path)
    headers ={user_id: 'User ID', af_recommend: 'Recommend', af_title: 'Title', af_image: 'Image url',
              af_link: 'Link', af_hashtag: 'Hashtag', af_price: 'Current Price', af_was_price: 'Old Price', 
              af_pct: 'PCT', af_ratings: 'Ratings', af_rating_code: 'Rating Code', af_reviews: 'Reviews', 
              af_oventype: 'Oven Type', af_baskettype: 'Basket Type', af_volume: 'Volume', af_material: 'Material',
              af_stainless: 'Stainless', af_power: 'Power', af_control: 'Controller', af_temp: 'Temperature', 
              af_timer: 'Timer', af_automenu: 'Auto Menu', af_rotisserie: 'Rotisserie',  af_steam: 'Steam', 
              af_doubleheating: 'Double heating', af_dry: 'Dry', af_cutheating: 'Cut heating', af_weight: 'Weight', af_size: 'Size'}
    xlsx.sheet(0).parse(headers).each_with_index do |row, row_index|
                                      
        next if row_index.zero? || Airfryer.find_by(af_title: row[:af_title]).present?

        Airfryer.create(
            user_id: row[:user_id],
            af_recommend: row[:af_recommend],
            af_title: row[:af_title],
            af_image: row[:af_image],
            af_link: row[:af_link],
            af_hashtag: row[:af_hashtag],
            af_price: row[:af_price],
            af_was_price: row[:af_was_price],
            af_pct: row[:af_pct],
            af_ratings: row[:af_ratings],
            af_rating_code: row[:af_rating_code],
            af_reviews: row[:af_reviews],
            af_oventype: row[:af_oventype],
            af_baskettype: row[:af_baskettype],
            af_volume: row[:af_volume],
            af_material: row[:af_material],
            af_stainless: row[:af_stainless],
            af_power: row[:af_power],
            af_control: row[:af_control],
            af_temp: row[:af_temp],
            af_timer: row[:af_timer],
            af_automenu: row[:af_automenu],
            af_rotisserie: row[:af_rotisserie],
            af_steam: row[:af_steam],
            af_doubleheating: row[:af_doubleheating],
            af_dry: row[:af_dry],
            af_cutheating: row[:af_cutheating],
            af_weight: row[:af_weight],
            af_size: row[:af_size]

        )
    end
  end

  def new
    unless current_user&.admin?
      redirect_to "/hub/authenticate_admin"
      return
    end

    @airfryer = current_user.airfryers.build
  end


  # GET /airfryers/1/edit
  def edit
  end

  # POST /airfryers or /airfryers.json
  def create
    # @airfryer = Airfryer.new(airfryer_params)
    @airfryer = current_user.airfryers.build(airfryer_params)

    respond_to do |format|
      if @airfryer.save
        format.html { redirect_to airfryer_url(@airfryer), notice: "Airfryer was successfully created." }
        format.json { render :show, status: :created, location: @airfryer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @airfryer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airfryers/1 or /airfryers/1.json
  def update
    respond_to do |format|
      if @airfryer.update(airfryer_params)
        format.html { redirect_to airfryer_url(@airfryer), notice: "Airfryer was successfully updated." }
        format.json { render :show, status: :ok, location: @airfryer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @airfryer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airfryers/1 or /airfryers/1.json
  def destroy
    @airfryer.destroy

    respond_to do |format|
      format.html { redirect_to airfryers_url, notice: "Airfryer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airfryer
      @airfryer = Airfryer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def airfryer_params
      params.require(:airfryer).permit(:af_title, :af_image, :af_hashtag, :af_price, :af_oventype, :af_baskettype, :af_volume, :af_material, :af_power, :af_control,
                                       :af_temp, :af_timer, :af_automenu, :af_rotisserie, :af_steam, :af_doubleheating, :af_dry, :af_weight, :af_size,
                                       :af_cutheating, :af_was_price, :af_pct, :af_rating_code, :af_reviews, :af_recommend, :af_ratings, :af_stainless, :af_link)
    end
end






















