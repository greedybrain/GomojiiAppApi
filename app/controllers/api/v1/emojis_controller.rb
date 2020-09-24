class Api::V1::EmojisController < ApplicationController
        
        def index 
                emojis = Emoji.all.order('created_at DESC')
                if !!emojis 
                        render json: {
                                emojis: EmojiSerializer.new(emojis).serializable_hash
                        }
                else
                        render json: {
                                fail: "No emojis found, try again later"
                        }
                end
        end

        def show 
                if params[:id]
                        emoji = Emoji.find(params[:id])
                        render json: {
                                emoji: EmojiSerializer.new(emoji).serializable_hash
                        }
                end
        end

        def create 
                if params[:user_id]
                        user = User.find(params[:user_id])
                        emoji = user.emojis.build(emoji_params)
                        if emoji.save 
                                render json: {
                                        emoji: EmojiSerializer.new(emoji).serializable_hash,
                                        success: "Emoji saved successfully"
                                }
                        else
                                render json: {
                                        fail: "You must be logged in to save an Emoji"
                                }
                        end
                end
        end

        def destroy 
                if params[:user_id] 
                        user = User.find(params[:user_id])
                        emoji = user.emojis.find(params[:id])
                        # emoji = user.user_favorites.find_by(params[:user_id])
                        if emoji.destroy
                                render json: {
                                        emoji: EmojiSerializer.new(emoji).serializable_hash,
                                        success: "Emoji removed from favorites"
                                }
                        end
                end
        end

        private

        def emoji_params
                params.permit(:slug, :character)
        end

end
