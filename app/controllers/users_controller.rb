class UsersController < ApplicationController
    def index
        render 'home/index'
    end

    def new
        render 'users/sign_up'
    end

    def login
        render 'users/login'
    end

    def create
        if User.find_by(Email: params[:email])
          flash[:error] = "User already exist"
          redirect_to '/sign_up'
        else
            @user = User.new(First_name: params[:firstname], Last_name: params[:lastname], Email: params[:email], password: params[:password], password_confirmation: params[:confirmation])
              #puts "accessed"
            if @user.valid?
              if @user.save
                #puts "saved"
                flash[:success] = "User successfully created"
                redirect_to '/login'
              else
                #puts "not saved"
                flash[:error] = "Something went wrong"
                render 'users/sign_up'
              end
            else
              flash[:validation_error] = @user.errors.messages
              redirect_to '/sign_up'
            end
        end
    end

    def sign_in
        @user = User.find_by(Email: params[:email])
        if @user
            if @user.authenticate(params[:password])
              session[:user_id] = @user.id
              #session[:username] = @user.First_name + " " + @user.Last_name
              if @user.isAdmin == true
                  session[:username] = @user.First_name + " " + @user.Last_name
                  session[:isAdmin] = true
              else
                  session[:username] = @user.First_name + " " + @user.Last_name
                  session[:isAdmin] = false
              end
              flash[:loggedIn] = "sucessfully logged in"
              redirect_to '/dashboard'
            else
              #puts "fail"
              flash[:error] = "Incorrect user password"
              redirect_to '/login'
            end
        else

            flash[:error] = "User does not exist"
            #puts "users does not exist"
            redirect_to '/login'
        end
    end


    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            flash[:success] = 'User was successfully deleted.'
            redirect_to '/dashboard'
        else
            flash[:error] = 'Something went wrong'
            redirect_to '/dasboard'
        end
    end

    def logout
        if session[:user_id] && session[:username]
          session[:user_id] = nil
          session[:username] = nil
          session[:isAdmin] = nil
          session[:getUsers] = nil
          flash[:logout] = 'Successfully logged out'
          redirect_to '/'
        else
          flash[:error] = 'Something went wrong'
          redirect_to '/'
        end
    end

    def all
      if session[:user_id] && session[:username]
        if session[:isAdmin] == true
          session[:getUsers] = true
        end
        redirect_to '/dashboard'
      else
        redirect_to '/'
      end
    end

    def updateRole
      if session[:user_id] && session[:username]
        @user = User.find(params[:id])
        if @user.isAdmin == true
            # "true"
            if @user.update_column(:isAdmin, false)
              flash[:success] = "Role change successfully"
              redirect_to '/dashboard'
            else
              flash[:error] = "Role change failed"
              redirect_to '/dashboard'
            end

        else
            #puts "false"
            if @user.update_column(:isAdmin, true)
              flash[:success] = "Role change successfully"
              redirect_to '/dashboard'
            else
              flash[:error] = "Role change failed"
              redirect_to '/dashboard'
            end
        end
      else
        redirect_to '/login'
      end
    end
end
