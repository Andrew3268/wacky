class DailySavingsController < ApplicationController
  before_action :set_daily_saving, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :hashtags]

  # GET /daily_savings or /daily_savings.json
  def index
    @daily_savings = DailySaving.all
  end

  # GET /daily_savings/1 or /daily_savings/1.json
  def show
  end

  # GET /daily_savings/new
  def new
    unless current_user&.admin?
      redirect_to "/hub/authenticate_admin"
      return
    end

    @daily_saving = current_user.daily_saving.build
  end

  # GET /daily_savings/1/edit
  def edit
  end

  # POST /daily_savings or /daily_savings.json
  def create
    @daily_saving = current_user.daily_saving.build(daily_saving_params)

    respond_to do |format|
      if @daily_saving.save
        format.html { redirect_to daily_saving_url(@daily_saving), notice: "Daily saving was successfully created." }
        format.json { render :show, status: :created, location: @daily_saving }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_savings/1 or /daily_savings/1.json
  def update
    respond_to do |format|
      if @daily_saving.update(daily_saving_params)
        format.html { redirect_to daily_saving_url(@daily_saving), notice: "Daily saving was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_saving }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_savings/1 or /daily_savings/1.json
  def destroy
    @daily_saving.destroy

    respond_to do |format|
      format.html { redirect_to daily_savings_url, notice: "Daily saving was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_saving
      @daily_saving = DailySaving.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_saving_params
      params.require(:daily_saving).permit(:ds_title, :ds_image, :ds_hashtag, :ds_price, :ds_was_price, :ds_pct, :ds_ratings, :ds_rating_code, :ds_reviews)
    end
end

