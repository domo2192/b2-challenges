class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
    @students = Student.all
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    professor = Professor.find(params[:id])
    professor.update(professor_params)
    professor.save
    redirect_to "/professors"
  end

  private
    def professor_params
    params.require(:professor).permit(:name, :age, :specialty)
  end
end
