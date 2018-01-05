class TxesController < ApplicationController
  before_action :set_tx, only: [:show, :edit, :update, :destroy]

  # GET /txes
  # GET /txes.json
  def index
    @txes = Tx.all
  end

  # GET /txes/1
  # GET /txes/1.json
  def show
  end

  # GET /txes/new
  def new
    @tx = Tx.new
  end

  # GET /txes/1/edit
  def edit
  end

  # POST /txes
  # POST /txes.json
  def create
    @tx = Tx.new(tx_params)

    respond_to do |format|
      if @tx.save
        format.html { redirect_to @tx, notice: 'Tx was successfully created.' }
        format.json { render :show, status: :created, location: @tx }
      else
        format.html { render :new }
        format.json { render json: @tx.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /txes/1
  # PATCH/PUT /txes/1.json
  def update
    respond_to do |format|
      if @tx.update(tx_params)
        format.html { redirect_to @tx, notice: 'Tx was successfully updated.' }
        format.json { render :show, status: :ok, location: @tx }
      else
        format.html { render :edit }
        format.json { render json: @tx.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /txes/1
  # DELETE /txes/1.json
  def destroy
    @tx.destroy
    respond_to do |format|
      format.html { redirect_to txes_url, notice: 'Tx was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tx
      @tx = Tx.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tx_params
      params.require(:tx).permit(:txhash, :txdata)
    end
end
