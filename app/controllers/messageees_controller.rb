class MessageeesController < ApplicationController
  before_action :set_messageee, only: [:show, :edit, :update, :destroy]

  # GET /messageees
  # GET /messageees.json
  def index
    @messageees = Messageee.all
  end

  # GET /messageees/1
  # GET /messageees/1.json
  def show
  end

  # GET /messageees/new
  def new
    @messageee = Messageee.new
  end

  # GET /messageees/1/edit
  def edit
  end

  # POST /messageees
  # POST /messageees.json
  def create
    @messageee = Messageee.new(messageee_params)

    respond_to do |format|
      if @messageee.save
        format.html { redirect_to @messageee, notice: 'Messageee was successfully created.' }
        format.json { render :show, status: :created, location: @messageee }
      else
        format.html { render :new }
        format.json { render json: @messageee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messageees/1
  # PATCH/PUT /messageees/1.json
  def update
    respond_to do |format|
      if @messageee.update(messageee_params)
        format.html { redirect_to @messageee, notice: 'Messageee was successfully updated.' }
        format.json { render :show, status: :ok, location: @messageee }
      else
        format.html { render :edit }
        format.json { render json: @messageee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messageees/1
  # DELETE /messageees/1.json
  def destroy
    @messageee.destroy
    respond_to do |format|
      format.html { redirect_to messageees_url, notice: 'Messageee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messageee
      @messageee = Messageee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messageee_params
      params.require(:messageee).permit(:asd)
    end
end
