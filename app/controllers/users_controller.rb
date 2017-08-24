class UsersController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    # not implemented
    before_filter(only: [:edit, :update, :destroy]) { require_correct_user }

    def index
      @users = User.where.not(:id => current_user.id)
      @my_invites = Invitation.where(:user_id => current_user.id)

      #p @users
      #@users = User.joins(:padewans).where.not(:id => current_user.id && :id => padewan.id)
      #@shoes = Shoe.where.not(:user_id => current_user.id)
      # Idea.joins(:likes).order('count(likes.id) DESC')
      # Idea.joins(:likes)
      # Idea.joins(left join likes on likes.idea_id = secrets.id').group(:id).order('count likes.id desc')
      # Idea.all.sort{|a, b| b.likes.count <=> a.likes.count}
    end

    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
      if @user.save
          flash[:notice] = ["Registered successfully"]
          session[:user_id] = @user.id
          return redirect_to dashboard_path
      end
      errors = @user.errors.full_messages
      flash[:errors] = errors
      return redirect_to :back
    end

    def dashboard
      @members = Member.where(:ninja_id => current_user.id)
      @invitations = Invitation.where(:padewan_id => current_user.id)
    end

    private def user_params
      params.require(:user).permit(:name, :email, :description, :password, :password_confirmation)
    end

    private def require_correct_user
      unless params[:id].to_i == session[:user_id]
        return redirect_to "/users/#{session[:user_id]}"
      end
    end
end
