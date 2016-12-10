class ProfilesController < ApplicationController
  def new
    # creating a new empty Profile object
    @profile =Profile.new
  end

  #create action creates a new Profile record associated with a User
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      #Show successful flash message and redirect to courses list
      flash[:notice] = 'You have created a new profile'
      redirect_to profile_path(@profile)
    else
      #render the new template
      render :new
    end
  end

#Get /profile
def index
  @profile = Profile.all
end

#GET /profile/1
#GET /profile/1.json
def show
  @profile = current_user.profile
end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :biography, :picture)
  end
end
