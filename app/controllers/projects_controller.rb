class ProjectsController < ApplicationController
    def dashboard
        #Displays the projects on the user's dashboard
        if session[:user_id] && session[:username]
            if session[:isAdmin] == false
                @project = Project.where(user_id: session[:user_id])
            end

            if session[:isAdmin] == true
                @project = Project.all
            end

            if session[:getUsers] == true
                @users = User.all
            end
            render 'projects/dashboard'
        else
            redirect_to '/login'
        end
    end

    def new
        # Displays the project addition page
        if session[:user_id] && session[:username]
            render 'projects/add'
        else
            redirect_to '/login'
        end
    end

    def edit
        # Displays the project edit page
        if session[:user_id] && session[:username]
            @project = Project.find(params[:id])
            render 'projects/edit'
        else
            redirect_to '/login'
        end
    end

    def show
        # displays and show just one project
        if session[:user_id] && session[:username]
            @project = Project.find(params[:id])
            render 'projects/show'
        else
            redirect_to '/login'
        end
    end

    def add
        # Process the addition of a new project to the database
        if session[:user_id] && session[:username]
            @project= Project.new(title: params[:title], description: params[:description], created_by: session[:username], user_id: session[:user_id])

            if @project.valid?
                if @project.save
                    redirect_to '/dashboard'
                else
                    redirect_to '/dashboard'
                end
            else
                flash[:error] = @project.errors.objects.first.full_message
                redirect_to '/add'
            end
        else
            redirect_to '/login'
        end
    end

    def update
        # Process the update of a project already in the database
        if session[:user_id] && session[:username]
            @project = Project.find(params[:id])

            if @project.update(title: params[:title], description: params[:description])
                redirect_to '/dashboard'
            else
                flash[:error] = @project.errors.objects.first.full_message
                value = params[:id].to_s
                redirect_to '/edit/'+'value'
            end
        else
            redirect_to '/login'
        end
    end

    def delete
        # Delete a project from the database
        if session[:user_id] && session[:username]
            @project = Project.find(params[:id])
            @project.destroy
            redirect_to '/dashboard'
        else
            redirect_to '/login'
        end
    end
end
