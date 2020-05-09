class Sessions::FormFields < BaseComponent
  needs operation : SaveSession

  def render

    mount Shared::Field.new(operation.formateur), &.text_input(autofocus: "true")
    mount Shared::Field.new(operation.begin_date, "Date de début"), &.date_input
    mount Shared::Field.new(operation.end_date, "Date de fin"), &.date_input
    mount Shared::Field.new(operation.intitule, "Intitulé")
  end
end
