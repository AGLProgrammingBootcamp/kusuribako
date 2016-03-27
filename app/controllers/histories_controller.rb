require 'date'

class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    @medicines = Medicine.all # 飲むべき薬リスト
    @histories = History.all # 飲んだ履歴

    # 飲むタイミング
    @timings = []
    @medicines.each do |medicine|
      medicine.frequencies.each do |frequency|
        @timings << frequency
      end
    end
    @timings.uniq!

    #@histories = History.all
    # 日付データ(開始日が悩ましい)
    @dates = []
    (Date.parse("2016-02-11")..Date.parse(Time.now.to_s)).each do |date|
      @dates << date
    end
    @dates.reverse!

    # 薬が飲めた/飲めなかったをハッシュで保持
    @achieves = {}
    @dates.each do |date|
      @achieves[date] = {}
      @timings.each do |timing|
        if timing.name == "朝"
          from = date.to_s + " 04:00:00"
          to = date.to_s + " 10:00:00"
          @achieves[date]["朝"] = History.where(:created_at => from...to).any?
        elsif timing.name == "昼"
          from = date.to_s + " 10:00:00"
          to = date.to_s + " 16:00:00"
          @achieves[date]["昼"] = History.where(:created_at => from...to).any?
        elsif timing.name == "夕"
          from = date.to_s + " 16:00:00"
          to = date.to_s + " 24:00:00"
          @achieves[date]["夕"] = History.where(:created_at => from...to).any?
        end
      end
    end
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    
    History.create
  
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    @history = History.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'History was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
      params.fetch(:history, {})
    end
end
