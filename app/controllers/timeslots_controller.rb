class TimeslotsController < ApplicationController
  before_action :set_timeslot, only: [:show, :edit, :update, :edit_calendar, :update_calendar, :destroy]

  # GET /timeslots
  # GET /timeslots.json
  def index
    @timeslots = Timeslot.all.order("id DESC")

    @dow_names = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  end

  # GET /timeslots/1
  # GET /timeslots/1.json
  def show
    @dow_names = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  end

  # GET /timeslots/new
  def new
    @timeslot = Timeslot.new
  end

  # GET /timeslots/1/edit
  def edit
    @timeslot.start_time = @timeslot.start_time.strftime("%H:%M")
  end

  # GET /timeslots/1/edit
  def edit_calendar
    @timeslot.start_time = @timeslot.start_time.strftime("%H:%M")
  end

  # POST /timeslots
  # POST /timeslots.json
  def create
    @timeslot = Timeslot.new(timeslot_params)

    respond_to do |format|
      if @timeslot.save
        format.html { redirect_to timeslots_path, notice: 'Timeslot was successfully created.' }
        format.json { render :show, status: :created, location: @timeslot }
      else
        format.html { render :new }
        format.json { render json: @timeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeslots/1
  # PATCH/PUT /timeslots/1.json
  def update
    respond_to do |format|
      if @timeslot.update(timeslot_params)
        format.html { redirect_to timeslots_path, notice: 'Timeslot was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeslot }
      else
        format.html { render :edit }
        format.json { render json: @timeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeslots/1
  # PATCH/PUT /timeslots/1.json
  def update_calendar
    respond_to do |format|
      if @timeslot.update(timeslot_params)
        format.html { redirect_to calendar_path, notice: 'Timeslot was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeslot }
      else
        format.html { render :edit }
        format.json { render json: @timeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeslots/1
  # DELETE /timeslots/1.json
  def destroy
    @timeslot.destroy
    respond_to do |format|
      format.html { redirect_to timeslots_url, notice: 'Timeslot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeslot
      @timeslot = Timeslot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeslot_params
      params.require(:timeslot).permit(:teacher_id, :dow, :start_time, :state, :footnote)
    end
end
