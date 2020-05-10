class Session < BaseModel
  table do
    column formateur : String
    column begin_date : Time
    column end_date : Time
    column intitule : String
    column uid : String
  end

  def complete_name
    "%s : %s par %s" % [format_end_date, intitule, formateur]
  end

  def format_end_date
    format_session_date(end_date)
  end

  def format_begin_date
    format_session_date(begin_date)
  end

  def format_session_date(date)
    Time::Format.new("%Y/%m/%d").format(date)
  end
end
