module V1
  class Users::RegistrationsController < Devise::RegistrationsController
    include Modules::Valid
    skip_before_action :verify_authenticity_token

    #POST /users
    def create
      if user = Modules::Valid.request(User.new, sign_up_params)
        if user.is_a?(Hash)
          warden.custom_failure!
          key, value = user.first
          render json: {error:true, message:"#{key} #{value}", data:nil}, status: 400
        else
          render json: {error:false, message:'', data: user.slice(:id, :email)}, status: 201
        end
      end
    end

    private

    def sign_up_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  end
end
