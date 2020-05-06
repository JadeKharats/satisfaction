class Sessions::FormFields < BaseComponent
  needs operation : SaveSession

  def render

    mount Shared::Field.new(operation.formateur), &.text_input(autofocus: "true")
    render_date_field(operation.begin_date,"Date de début" )
    render_date_field(operation.end_date,"Date de fin" )
    mount Shared::Field.new(operation.intitule, "Intitulé")
  end

  private def render_date_field(attribute, label_text)
    div class: "field" do
      label_for attribute, label_text, class: "label"
      div class: "control" do
        date_input(attribute, attrs: [:required], class: "input" )
        mount Shared::FieldErrors.new(attribute)
      end
    end
  end
end
