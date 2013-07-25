class PeopleController < ApplicationController
  before_filter :find_person, only: [:show, :destroy]

  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    params[:person][:first_name].capitalize!
    params[:person][:last_name].capitalize!
    @person = Person.create(params[:person])
    if @person.valid?
      flash[:notice] = "Person has been added."
      redirect_to @person
    else
      flash[:alert] = "Person has not been added."
      render action: 'new'
    end
  end

  def destroy
    @person.destroy
    flash[:notice] = "Person has been removed."
    redirect_to people_path
  end

private
  def find_person
    @person = Person.find(params[:id])
  end
end
