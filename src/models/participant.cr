class Participant < BaseModel
  table do
    column prenom : String
    column nom : String
    column code : String
    belongs_to session : Session
  end

  def complete_name
    "#{prenom} #{nom}"
  end
end
