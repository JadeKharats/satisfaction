class Session < BaseModel
  table do
    column formateur : String
    column begin_date : Time
    column end_date : Time
    column intitule : String
    column uid : Int16
  end
end
