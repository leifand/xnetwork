class InvitationsController < ApplicationController

  def create
    @padewan = User.find(params[:id])
    Invitation.create(user:current_user, padewan:@padewan)
    redirect_to '/users'
  end

  def accept
    @ninja = User.find(params[:id])
    Member.create(user:current_user, ninja:@ninja)
    #@invitation = Invitation.where(@ninja.id => :padewan_id).destroy
    #Invitation.destroy(params[:id] => :padewan_id)
    redirect_to '/users'
  end

  def ignore
    #@destroy = Invitation.where(:padewan_id => params[:id])
    #Invitation.destroy(params[:id])
    redirect_to '/users'
  end
end
