class MoneyOutsController < ApplicationController
  before_action :set_money_out, only: %i[ show edit update destroy ]

  # GET /money_outs or /money_outs.json
  def index
    @q = MoneyOut.includes(:category).ransack(params[:q])
    @pagy, @money_outs = pagy(@q.result.order(created_at: :desc))
    @categories = Category.all
  end

  # GET /money_outs/1 or /money_outs/1.json
  def show
  end

  # GET /money_outs/new
  def new
    @money_out = MoneyOut.new
  end

  # GET /money_outs/1/edit
  def edit
  end

  # POST /money_outs or /money_outs.json
  def create
    @money_out = MoneyOut.new(money_out_params)

    respond_to do |format|
      if @money_out.save
        format.html { redirect_to money_outs_path, notice: "Despesa criada com sucesso." }
        format.json { render :show, status: :created, location: @money_out }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @money_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /money_outs/1 or /money_outs/1.json
  def update
    respond_to do |format|
      if @money_out.update(money_out_params)
        format.html { redirect_to money_outs_path, notice: "Despesa atualizada com sucesso.", status: :see_other }
        format.json { render :show, status: :ok, location: @money_out }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @money_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money_outs/1 or /money_outs/1.json
  def destroy
    @money_out.destroy!

    respond_to do |format|
      format.html { redirect_to money_outs_path, notice: "Despesa excluída com sucesso.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_out
      @money_out = MoneyOut.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def money_out_params
      params.expect(money_out: [ :label, :description, :amount, :money_date, :category_id ])
    end
end
