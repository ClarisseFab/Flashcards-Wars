class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trainings


  def level
    case experience
    when 0..99
      1
    when 100..199
      2
    when 200..399
      3
    when 400..699
      4
    when 700..1099
      5
    else
      # Calculer pour les niveaux supérieurs
      5 + ((experience - 1099) / 500)
    end
  end




end
