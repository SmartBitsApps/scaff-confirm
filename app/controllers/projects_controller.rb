class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @projects = Project.all.order(created_at: :desc).where(public: true)
  end
  
  def show
    @managers = User.all.where(role: 2)
    @project = Project.find(params[:id])
  end
  
  def new
    @project = current_user.projects.new
    #@project.addresses.build
  end
  
  def edit
    @managers = User.all.where(role: 2)
    @project = Project.find(params[:id])
    
  end
  
  def create
    #binding.pry
    @project = current_user.projects.build(project_params)
    

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Projekt byl úspěšně vytvořen.' }
        format.json { render :show, status: :created, location: @project }
      else
        @project.event_addresses.build
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @project = Project.find(params[:id])
    #authorize @account
    respond_to do |format|
      
      if @project.update(project_params)
        
        #if @project.status == :completed
        #  @project.user.update_attributes(role: :user)
        #end
        format.html { redirect_to @project, notice: 'Projekt byl úspěšně upraven.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    project = Project.find(params[:id])
    project.destroy
    #authorize @project
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Projekt byl smazán.' }
      format.json { head :no_content }
    end
  end
  
  
  private
  
  def project_params
    params.require(:project).permit(:user_id, :title, :description, :manager_id, :client_id, :public)
  end
  
end
