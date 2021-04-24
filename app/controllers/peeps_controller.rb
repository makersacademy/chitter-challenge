class PeepsController < ApplicationController
  before_action :set_peep, only: %i[ show edit update destroy ]

  # GET /peeps or /peeps.json
  def index
    @peeps = Peep.all
  end

  # GET /peeps/1 or /peeps/1.json
  def show
  end

  # GET /peeps/new
  def new
    @peep = Peep.new
  end

  # GET /peeps/1/edit
  def edit
  end

  # POST /peeps or /peeps.json
  def create
    @peep = Peep.new(peep_params)

    respond_to do |format|
      if @peep.save
        format.html { redirect_to @peep, notice: "Peep was successfully created." }
        format.json { render :show, status: :created, location: @peep }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peeps/1 or /peeps/1.json
  def update
    respond_to do |format|
      if @peep.update(peep_params)
        format.html { redirect_to @peep, notice: "Peep was successfully updated." }
        format.json { render :show, status: :ok, location: @peep }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peeps/1 or /peeps/1.json
  def destroy
    @peep.destroy
    respond_to do |format|
      format.html { redirect_to peeps_url, notice: "Peep was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peep
      @peep = Peep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peep_params
      params.require(:peep).permit(:content, :user_id)
    end
end
