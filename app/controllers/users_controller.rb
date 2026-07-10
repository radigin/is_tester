class UsersController < ApplicationController
  before_action :check_app_auth, except: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if @current_user_object.is_real_admin?
      @users = User
      if params.has_key?(:sort)
        @users = @users.order("#{params[:sort]}")
      end
      if params.has_key?(:filter)
        @users = @users.where("is_real_admin = #{params[:filter]}")
      end
    else
      @users = User.where("(is_real_admin IS NULL OR is_real_admin = 0) AND user_login != 'test'")
    end
    if params.has_key?(:search)
      @users = @users.where("lower(user_login) like lower('#{params['search']}%')")
    end
    @users = @users.all  
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.is_real_admin = 0 if @current_user_object.blank? or !@current_user_object.is_real_admin?
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user.is_real_admin = 0 unless @current_user_object.is_real_admin?

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:user_login, :user_password, :email, :is_real_admin, :hobbies)
    end

    def check_ctr_auth()
      return true if [:new, :create, :edit].include?(action_name.to_sym)
      return true if @current_user_object.is_real_admin?
      return true if [:index].include?(action_name.to_sym)
      if [:show].include?(action_name.to_sym)
        if @user.nil?
          set_user()
        end
        if @user.is_real_admin? == false and @user.user_login != 'test'
          return true   
        end
      end
      return false
    end  
end
