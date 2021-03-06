class CustomizedPreferencesController < ApplicationController
  def index
    @q = CustomizedPreference.ransack(params[:q])
    @customized_preferences = @q.result(:distinct => true).includes(:user, :goal, :event).page(params[:page]).per(10)

    render("customized_preference_templates/index.html.erb")
  end

  def show
    @customized_preference = CustomizedPreference.find(params.fetch("id_to_display"))

    render("customized_preference_templates/show.html.erb")
  end

  def new_form
    @customized_preference = CustomizedPreference.new

    render("customized_preference_templates/new_form.html.erb")
  end

  def create_row
    @customized_preference = CustomizedPreference.new

    @customized_preference.event_id = params.fetch("event_id")
    @customized_preference.user_id = params.fetch("user_id")
    @customized_preference.transaction_amount = params.fetch("transaction_amount")
    @customized_preference.goal_id = params.fetch("goal_id")

    if @customized_preference.valid?
      @customized_preference.save

      redirect_back(:fallback_location => "/customized_preferences", :notice => "Customized preference created successfully.")
    else
      render("customized_preference_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_goal
    @customized_preference = CustomizedPreference.new

    @customized_preference.event_id = params.fetch("event_id")
    @customized_preference.user_id = params.fetch("user_id")
    @customized_preference.transaction_amount = params.fetch("transaction_amount")
    @customized_preference.goal_id = params.fetch("goal_id")

    if @customized_preference.valid?
      @customized_preference.save

      redirect_to("/goals/#{@customized_preference.goal_id}", notice: "CustomizedPreference created successfully.")
    else
      render("customized_preference_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_event
    @customized_preference = CustomizedPreference.new

    @customized_preference.event_id = params.fetch("event_id")
    @customized_preference.user_id = params.fetch("user_id")
    @customized_preference.transaction_amount = params.fetch("transaction_amount")
    @customized_preference.goal_id = params.fetch("goal_id")

    if @customized_preference.valid?
      @customized_preference.save

      redirect_to("/events/#{@customized_preference.event_id}", notice: "CustomizedPreference created successfully.")
    else
      render("customized_preference_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @customized_preference = CustomizedPreference.find(params.fetch("prefill_with_id"))

    render("customized_preference_templates/edit_form.html.erb")
  end

  def update_row
    @customized_preference = CustomizedPreference.find(params.fetch("id_to_modify"))

    @customized_preference.event_id = params.fetch("event_id")
    @customized_preference.user_id = params.fetch("user_id")
    @customized_preference.transaction_amount = params.fetch("transaction_amount")
    @customized_preference.goal_id = params.fetch("goal_id")

    if @customized_preference.valid?
      @customized_preference.save

      redirect_to("/customized_preferences/#{@customized_preference.id}", :notice => "Customized preference updated successfully.")
    else
      render("customized_preference_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @customized_preference = CustomizedPreference.find(params.fetch("id_to_remove"))

    @customized_preference.destroy

    redirect_to("/users/#{@customized_preference.user_id}", notice: "CustomizedPreference deleted successfully.")
  end

  def destroy_row_from_goal
    @customized_preference = CustomizedPreference.find(params.fetch("id_to_remove"))

    @customized_preference.destroy

    redirect_to("/goals/#{@customized_preference.goal_id}", notice: "CustomizedPreference deleted successfully.")
  end

  def destroy_row_from_event
    @customized_preference = CustomizedPreference.find(params.fetch("id_to_remove"))

    @customized_preference.destroy

    redirect_to("/events/#{@customized_preference.event_id}", notice: "CustomizedPreference deleted successfully.")
  end

  def destroy_row
    @customized_preference = CustomizedPreference.find(params.fetch("id_to_remove"))

    @customized_preference.destroy

    redirect_to("/customized_preferences", :notice => "Customized preference deleted successfully.")
  end
end
