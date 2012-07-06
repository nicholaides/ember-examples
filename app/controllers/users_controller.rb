class UsersController < ApplicationController
  def show
    sleep 3
    render json: {
                   firstName:  "Dave",
                   lastName:   "Coullier",
                   avatarPath: "/assets/dave.jpeg",
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
          avatarPath: "/assets/dave.jpeg",
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
          lastName:   "Cammeron",
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
          firstName:  "John",
          lastName:   "Stamos",
          avatarPath: "/assets/john.jpg",
          pokesPath:  "/users/john/pokes"
        },
        {
          firstName:  "Dave",
          lastName:   "Coullier",
          avatarPath: "/assets/dave.jpeg",
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
          lastName:   "Cammeron",
          avatarPath: "/assets/candace.jpg",
          pokesPath:  "/users/candace/pokes"
      }
      ]
    }
  end
end
