class PiecesController < ApplicationController
  before_action :set_piece, only: %i[show edit update destroy]

  # GET /pieces/1
  # GET /pieces/1.json
  def show
    @current_piece = Piece.find(params[:id])
    @game = @current_piece.game
  end

  # GET /pieces/1/edit
  def edit; end

  # POST /pieces
  # POST /pieces.json
  def create
    @piece = Piece.new(piece_params)

    respond_to do |format|
      if @piece.save
        format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
        format.json { render :show, status: :created, location: @piece }
      else
        format.html { render :new }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pieces/1
  # PATCH/PUT /pieces/1.json
  def update
    @current_piece = Piece.find(params[:id])
    @game = @current_piece.game
    @current_piece.update_attributes(piece_params)
    redirect_to game_path(@game)
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.json
  def destroy
    @piece.destroy
    respond_to do |format|
      format.html { redirect_to pieces_url, notice: 'Piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_piece
    @piece = Piece.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def piece_params
    params.require(:piece).permit(:position_x, :position_y)
  end
end