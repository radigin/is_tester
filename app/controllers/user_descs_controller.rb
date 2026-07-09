class UserDescsController < ApplicationController
  before_action :set_user_desc, only: %i[ show edit update destroy ]

  # GET /user_descs or /user_descs.json
  def index
    @user_descs = UserDesc.all
  end

  # GET /user_descs/1 or /user_descs/1.json
  def show
  end

  # GET /user_descs/new
  def new
    @user_desc = UserDesc.new
  end

  # GET /user_descs/1/edit
  def edit
  end

  # POST /user_descs or /user_descs.json
  def create
    @user_desc = UserDesc.new(user_desc_params)

    respond_to do |format|
      if @user_desc.save
        format.html { redirect_to @user_desc, notice: "User desc was successfully created." }
        format.json { render :show, status: :created, location: @user_desc }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @user_desc.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /user_descs/1 or /user_descs/1.json
  def update
    respond_to do |format|
      if @user_desc.update(user_desc_params)
        format.html { redirect_to @user_desc, notice: "User desc was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @user_desc }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @user_desc.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /user_descs/1 or /user_descs/1.json
  def destroy
    @user_desc.destroy!

    respond_to do |format|
      format.html { redirect_to user_descs_path, notice: "User desc was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_desc
      @user_desc = UserDesc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_desc_params
      params.require(:user_desc).permit(:lname, :fname, :sname, :address, :user_id)
    end
end
