class Procedure < ActiveRecord::Base
  attr_accessible :created_at, :kapabe, :name, :prot, :updated_at, :project_id

  has_one :project
  has_many :procedure_resources, :dependent => :destroy
  has_many :procedure_procedures, foreign_key: "prepro_id", :dependent => :destroy
  has_many :reverse_procedure_procedures, foreign_key: "sucpro_id", class_name: "ProcedureProcedure", :dependent => :destroy

end
