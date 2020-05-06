class SaveSession < Session::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  permit_columns formateur, begin_date, end_date, intitule
end
