class MoneyInsController < ApplicationController
  before_action :set_money_in, only: %i[ show edit update destroy ]

  # GET /money_ins or /money_ins.json
  def index
    @pagy, @money_ins = pagy(MoneyIn.all)
  end

  # GET /money_ins/1 or /money_ins/1.json
  def show
  end

  # GET /money_ins/new
  def new
    @money_in = MoneyIn.new
  end

  # GET /money_ins/1/edit
  def edit
  end

  # POST /money_ins or /money_ins.json
  def create
    @money_in = MoneyIn.new(money_in_params)

    respond_to do |format|
      if @money_in.save
        format.html { redirect_to @money_in, notice: "Money in was successfully created." }
        format.json { render :show, status: :created, location: @money_in }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @money_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /money_ins/1 or /money_ins/1.json
  def update
    respond_to do |format|
      if @money_in.update(money_in_params)
        format.html { redirect_to @money_in, notice: "Money in was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @money_in }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @money_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money_ins/1 or /money_ins/1.json
  def destroy
    @money_in.destroy!

    respond_to do |format|
      format.html { redirect_to money_ins_path, notice: "Money in was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_in
      @money_in = MoneyIn.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def money_in_params
      params.expect(money_in: [ :label, :description, :amount, :money_date, :category_id ])
    end
end
