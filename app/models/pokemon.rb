class Pokemon < ActiveRecord::Base
  belongs_to :trainer
  validates :name, :presence => {:message => "Your pokemon needs a name."}, :uniqueness => {:message => "The name of your pokemon needs to be unique."}
end
