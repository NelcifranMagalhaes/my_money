module MoneyOutsHelper
  def recurrency_badge(money_out)
    if money_out.recurrency?
      content_tag(:span, "Sim", class: "badge text-bg-success")
    else
      content_tag(:span, "Não", class: "badge text-bg-secondary")
    end
  end

  def installment_badge(money_out)
    if money_out.installment > 0 && money_out.original_money_out.present?
      "#{money_out.installment}ª de #{money_out.original_money_out.try(:recurrency_quantity)}"
    elsif money_out.installment > 0 && money_out.original_money_out.nil?
      "#{money_out.installment}ª de #{money_out.recurrency_quantity}"
    else
      "Única"
    end
  end
end
