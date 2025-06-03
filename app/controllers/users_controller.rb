class UsersController < ApplicationController
  include Pagy::Backend

  before_action :set_user, only: %i[update]

  def index
    @pagy, @users = pagy(User.all)

    @user = User.new
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Usuário atualizado com sucesso!"
      render turbo_stream: turbo_stream.action(:redirect, users_path)
    else
      render turbo_stream: turbo_stream.replace("form_user",
        partial: "form", locals: {user: @user, btn_save: "Salvar"}
      )
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
