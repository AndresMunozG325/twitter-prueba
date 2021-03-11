class FriendsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user, only: [:create]
    

    def create
        f = current_user.friends.where(friend_id:@user.id)
        if f.count > 0
            redirect_to root_path, notice:"La amistad ya existe"
        else
            add_friend = Friend.new(user:current_user, friend_id:@user.id)    
            #end
            if add_friend.save
                redirect_to root_path
            else
                redirect_to root_path, notice:"No se pudo crear la amistad"
            end
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @friend = Friend.where(user_id: @user.id).where(friend_id: params[:id].to_i)
        if @friend.nil?
            redirect_to root_path, notice:"Amistad no encontrada"
        else
            @friend.each do |friend|
                friend.destroy    
            end
            redirect_to root_path
        end
      end

    private
    def find_user
        @user = User.find(params[:user_id])
    en
end
