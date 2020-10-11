class Api::V1::UserFavoritesController < ApplicationController
        def index 
                if params[:user_id]
                        user = User.find(params[:user_id])
                        user_favorites = user.user_favorites
                        render json: {
                                user_favorites: UserFavoriteSerializer.new(user_favorites),
                                message: "Listing #{user.email}'s favorite emojis"
                        }
                end
        end

        def create 
                if params[:user_id]
                        user = User.find(params[:user_id])
                        emoji = user.user_favorites.build(emoji_params)
                        if emoji.save 
                                binding.pry
                                render json: {
                                        emoji: UserFavoriteSerializer.new(emoji).serializable_hash,
                                        success: "Emoji saved successfully"
                                }
                        else
                                render json: {
                                        fail: "You must be logged in to save an Emoji"
                                }
                        end
                end
        end

        # def destroy 
        #         if params[:user_id] 
        #                 user = User.find(params[:user_id])
        #                 emoji = user.emojis.find(params[:id])

        #                 # emoji = user.user_favorites.find_by(params[:user_id])
        #                 if emoji.destroy
        #                         render json: {
        #                                 emoji: EmojiSerializer.new(emoji).serializable_hash,
        #                                 success: "Emoji removed from favorites"
        #                         }
        #                 end
        #         end
        # end

        private

        def emoji_params
                params.permit(:slug, :character, :unicodeName, :codePoint, :group, :subGroup, :variants)
        end
end
