module KaExtUsers
  class UsersController < KaExtUsers::ApplicationController
    def index
      @users = [{:id => 1, :fname => "Fname1", :lname => "Lname1"},
                    {:id => 2, :fname => "Fname2", :lname => "Lname2"},
                    {:id => 3, :fname => "Fname3", :lname => "Lname3"}]
      render json: @users
    end
  end
end