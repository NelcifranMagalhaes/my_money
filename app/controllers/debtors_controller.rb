class DebtorsController < ApplicationController
  before_action :set_debtor, only: %i[ show edit update destroy ]

  # GET /debtors or /debtors.json
  def index
    @pagy, @debtors = pagy(Debtor.where(user: Current.user).order(created_at: :desc))
  end

  # GET /debtors/1 or /debtors/1.json
  def show
  end

  # GET /debtors/new
  def new
    @debtor = Debtor.new
  end

  # GET /debtors/1/edit
  def edit
  end

  # POST /debtors or /debtors.json
  def create
    @debtor = Debtor.new(debtor_params.merge(user: Current.user))

    respond_to do |format|
      if @debtor.save
        format.html { redirect_to @debtor, notice: t("debtor_saved") }
        format.json { render :show, status: :created, location: @debtor }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @debtor.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /debtors/1 or /debtors/1.json
  def update
    respond_to do |format|
      if @debtor.update(debtor_params)
        format.html { redirect_to @debtor, notice: t("debtor_updated"), status: :see_other }
        format.json { render :show, status: :ok, location: @debtor }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @debtor.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /debtors/1 or /debtors/1.json
  def destroy
    @debtor.destroy!

    respond_to do |format|
      format.html { redirect_to debtors_path, notice: t("debtor_deleted"), status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debtor
      @debtor = Debtor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def debtor_params
      params.expect(debtor: [ :name ])
    end
end
