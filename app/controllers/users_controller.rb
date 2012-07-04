class UsersController < ApplicationController
  def show
    attributes = case params[:id]
                 when 'dave'
                   {
                     firstName: "Dave",
                     lastName:  "Coullier",
                     avatarPath: "/assets/dave.jpeg"
                   }
                 end
    sleep 3
    render json: attributes
  end
end
