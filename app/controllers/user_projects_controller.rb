class UserProjectsController < ApplicationController

  def apply_for_project
    @project = Project.find(params[:project_id])
    UserProject.create(user_id: params[:user_id], project_id: params[:project_id])
    flash[:notice] = "You have applied for #{@project.title}"
    @project.admin.notifications.build(content: "#{current_user.name} has applied to work on #{@project.title}").save
    redirect_to @project
  end

  def approve_collaboration
    @user_project = UserProject.find_by(user_id: params[:user_id], project_id: params[:project_id])
    @user_project.approved = true
    @user_project.save
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @user.notifications.build(content: "#{current_user.name} has approved you to work on #{@project.title}").save
    flash[:notice] = "#{@user.name} has been added to your team"
    redirect_to @project
  end

  def deny_collaboration
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @user_project = UserProject.find_by(user_id: params[:user_id], project_id: params[:project_id])
    @user_project.destroy
    @user.notifications.build(content: "Your request to work on #{@project.title} has been denied").save
    flash[:notice] = "#{@user.name}'s request to join your team has been denied."
    redirect_to @project
  end

  def invite
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @user.notifications.build(content: "#{current_user.name} has invited you to work on", project_id: params[:project_id]).save
    redirect_to @project
  end

  def close_project
    @project = Project.find(params[:project_id])
    @project.status = "completed"
    @project.save
    redirect_to @project
  end

  def in_progress
    @project = Project.find(params[:project_id])
    @project.status = "in_progress"
    @project.save
    redirect_to @project
  end

  def update
    project = Project.find(params[:project_id])
    
    @user_skill = UserSkill.find_by_user_id_and_skill_id(params[:user_id], params[:skill_id])
    @user_skill.update_score
    @user_skill.rated = true
    @user_skill.save

    redirect_to project
  end

end