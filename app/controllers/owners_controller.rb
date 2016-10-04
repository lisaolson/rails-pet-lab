class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.create(owner_params)
    if owner.save
      flash[:notice] = "Owner successfully created"
      redirect_to owner_path(owner)
    end
  end

  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def edit
    owner_id = params[:id]
    @owner = Owner.find_by_id(owner_id)
  end

  def update
    owner_id = params[:id]
    owner = Owner.find_by_id(owner_id)
    if  owner.update_attributes(owner_params)
      flash[:notice] = "Owner successfully updated"
      redirect_to owner_path(owner)
    end

  end

  def destroy
    # stretch
  end


  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end

end
