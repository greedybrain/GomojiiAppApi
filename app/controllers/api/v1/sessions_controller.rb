class Api::V1::SessionsController < ApplicationController
        def login 
                user = User.find_by(email: params[:email])
                if user&.authenticate(params[:password])
                        session[:user_id] = user.id
                        render json: {
                                status: :created,
                                logged_in: true,
                                user: UserSerializer.new(user)
                        }
                else
                        render json: {
                                status: 400,
                                error: "Incorrect username and/or password"
                        }
                end
        end

        def login_check
                if logged_in
                        render json: {
                                user: UserSerializer.new(current_user),
                                logged_in: true
                        }
                else
                        render json: {
                                logged_in: false
                        }
                end
        end

        def logout
                session.clear
                render json: {
                        status: 200,
                        logged_in: false
                }
        end
end
