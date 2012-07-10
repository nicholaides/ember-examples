class UsersController < ApplicationController
  def show
    sleep 3
    render json: {
                   firstName:  "Dave",
                   lastName:   "Coullier",
                   avatarPath: "/assets/dave.jpg",
                   pokesPath:  "/users/dave/pokes"
                 }
  end

  def index
    render json: {
      users: [
        {
          firstName:  "John",
          lastName:   "Stamos",
          avatarPath: "/assets/john.jpg",
          pokesPath:  "/users/john/pokes"
        },
        {
          firstName:  "Dave",
          lastName:   "Coullier",
          avatarPath: "/assets/dave.jpg",
          pokesPath:  "/users/dave/pokes"
        },
        {
          firstName:  "Bob",
          lastName:   "Sagget",
          avatarPath: "/assets/bob.jpg",
          pokesPath:  "/users/bob/pokes"
        },
        {
          firstName:  "Candace",
          lastName:   "Cameron",
          avatarPath: "/assets/candace.jpg",
          pokesPath:  "/users/candace/pokes"
      }
      ]
    }
  end

  def more
    render json: {
      users: [
        {
          firstName:  "Jodie",
          lastName:   "Sweetin",
          avatarPath: "/assets/jodie.jpg",
          pokesPath:  "/users/jodie/pokes"
        },
        {
          firstName:  "Mary-Kate",
          lastName:   "Olsen",
          avatarPath: "/assets/mary-kate.jpg",
          pokesPath:  "/users/dave/pokes"
        },
        {
          firstName:  "Ashley",
          lastName:   "Olsen",
          avatarPath: "/assets/ashley.jpg",
          pokesPath:  "/users/ashley/pokes"
        },
        {
          firstName:  "Andrea",
          lastName:   "Barber",
          avatarPath: "/assets/andrea.jpg",
          pokesPath:  "/users/andrea/pokes"
      }
      ]
    }
  end
end
