class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if(params[:query])
      @users = User.search(params[:typeSearch], params[:query])
    else
      @users = User.all
    end
    @users.each do |us|
      puts setPatternPhone(us.phone)
    end
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
    @user.phone = setPatternPhone(@user.phone)
    @user.cpf = setPatternCpf(@user.cpf)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      aux_params = user_params
      aux_params[:phone] = setPatternPhone(user_params[:phone])
      aux_params[:cpf] = setPatternCpf(user_params[:cpf])

      if @user.update(aux_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    def setPatternCpf(cpf)
      newCpf = ""
      cpf.split('').each do |ch|
        if (ch =~ /\d/)
          newCpf += ch
        end
      end
      newCpf
    end

    def setPatternPhone(phone)
      newPhone = ""
      phone.split('').each do |ch|
        if(ch =~ /\d/)
          newPhone += ch
        end
      end

      if(newPhone.length == 10)
        aux = ""
        newPhone.split('').each_with_index do |ch,i|
          aux += ch
          if i == 1
            aux += '9'
          end
        end
        newPhone = aux
      end

      if(newPhone.length == 12)

        aux = ""
        newPhone.split('').each_with_index do |ch,i|
          aux += ch
          if i == 3
            aux += '9'
          end
        end
        newPhone = aux
      end

      if(newPhone.length == 11)
        newPhone = "55" + newPhone
      end
      newPhone = "+" + newPhone
      
      newPhone
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :cpf)
    end
end
