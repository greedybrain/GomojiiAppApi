class Api::V1::RegistrationsController < ApplicationController

        def signup 
                user = User.new(user_params)
                if user.save
                        session[:user_id] = user.id
                        render json: {
                                user: UserSerializer.new(user),
                                status: :created,
                                logged_in: true
                        }
                else
                        render json: {
                                email_error: user.errors.messages[:email],
                                password_error: user.errors.messages[:password],
                                password_confirmation_error: "Passwords don't match",
                                status: 400
                        }
                end
        end

        private 

        def user_params 
                params.permit(:email, :password, :password_confirmation)
        end

end
