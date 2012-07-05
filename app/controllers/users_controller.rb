class UsersController < ApplicationController
  def show
    sleep 3
    render json: {
                   firstName:  "Dave",
                   lastName:   "Coullier",
                   avatarPath: "/assets/dave.jpeg",
                   pokesPath:  user_pokes_path(params[:id])
                 }
  end
end
