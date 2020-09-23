class Api::V1::UsersController < ApplicationController

        def index 
                users = User.all.order('created_at DESC')
                if users 
                        render json: {
                                users: UserSerializer.new(users).serializable_hash
                        }
                end
        end

        def show 
                user = User.find(params[:id])
                if user 
                        render json: {
                                user: UserSerializer.new(user).serializable_hash
                        }
                end
        end 

end
