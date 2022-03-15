class WordNetsController < ApplicationController
  before_action :set_word_net, only: %i[ show edit update destroy ]

  # GET /word_nets or /word_nets.json
  def index
    @word_nets = WordNet.all
  end

  # GET /word_nets/1 or /word_nets/1.json
  def show
  end

  # GET /word_nets/new
  def new
    @word_net = WordNet.new
  end

  # GET /word_nets/1/edit
  def edit
  end

  # POST /word_nets or /word_nets.json
  def create
    @word_net = WordNet.new(word_net_params)

    respond_to do |format|
      if @word_net.save
        format.html { redirect_to word_net_url(@word_net), notice: "Word net was successfully created." }
        format.json { render :show, status: :created, location: @word_net }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @word_net.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_nets/1 or /word_nets/1.json
  def update
    respond_to do |format|
      if @word_net.update(word_net_params)
        format.html { redirect_to word_net_url(@word_net), notice: "Word net was successfully updated." }
        format.json { render :show, status: :ok, location: @word_net }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @word_net.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_nets/1 or /word_nets/1.json
  def destroy
    @word_net.destroy

    respond_to do |format|
      format.html { redirect_to word_nets_url, notice: "Word net was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_net
      @word_net = WordNet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_net_params
      params.fetch(:word_net, {})
    end
end
