class Sessions::Information::Row < BaseComponent
  needs i18n_key : String
  needs information : String
  def render
    div class: "columns" do
      div class: "column" do
        text I18n.t(i18n_key)
      end
      div class: "column" do
        strong information
      end
    end
  end
end
