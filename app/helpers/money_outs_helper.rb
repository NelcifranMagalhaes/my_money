module MoneyOutsHelper
  def recurrency_badge(money_out)
    if money_out.recurrency?
      content_tag(:span, "Sim", class: "badge text-bg-success")
    else
      content_tag(:span, "Não", class: "badge text-bg-secondary")
    end
  end
end
