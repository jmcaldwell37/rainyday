class GoalsController < ApplicationController
  before_action :current_user_must_be_goal_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_goal_user
    goal = Goal.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == goal.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @goals = Goal.all

    render("goal_templates/index.html.erb")
  end

  def show
    @customized_preference = CustomizedPreference.new
    @goal = Goal.find(params.fetch("id_to_display"))

    render("goal_templates/show.html.erb")
  end

  def new_form
    @goal = Goal.new

    render("goal_templates/new_form.html.erb")
  end

  def create_row
    @goal = Goal.new

    @goal.user_id = params.fetch("user_id")
    @goal.description = params.fetch("description")
    @goal.name = params.fetch("name")
    @goal.d_or_s = params.fetch("d_or_s")
    @goal.goal_amount = params.fetch("goal_amount")
    @goal.current_amount = params.fetch("current_amount")
    @goal.deadline = params.fetch("deadline")

    if @goal.valid?
      @goal.save

      redirect_back(:fallback_location => "/goals", :notice => "Goal created successfully.")
    else
      render("goal_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @goal = Goal.find(params.fetch("prefill_with_id"))

    render("goal_templates/edit_form.html.erb")
  end

  def update_row
    @goal = Goal.find(params.fetch("id_to_modify"))

    
    @goal.description = params.fetch("description")
    @goal.name = params.fetch("name")
    @goal.d_or_s = params.fetch("d_or_s")
    @goal.goal_amount = params.fetch("goal_amount")
    @goal.current_amount = params.fetch("current_amount")
    @goal.deadline = params.fetch("deadline")

    if @goal.valid?
      @goal.save

      redirect_to("/goals/#{@goal.id}", :notice => "Goal updated successfully.")
    else
      render("goal_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @goal = Goal.find(params.fetch("id_to_remove"))

    @goal.destroy

    redirect_to("/users/#{@goal.user_id}", notice: "Goal deleted successfully.")
  end

  def destroy_row
    @goal = Goal.find(params.fetch("id_to_remove"))

    @goal.destroy

    redirect_to("/goals", :notice => "Goal deleted successfully.")
  end
end
