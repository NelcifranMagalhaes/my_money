module MoneyOutsHelper
  def installment_badge(money_out)
    if money_out.installment > 0 && money_out.original_money_out.present?
      content_tag(:span, "#{money_out.installment}ª de #{money_out.original_money_out.try(:recurrency_quantity)}", class: "badge text-bg-info")
    elsif money_out.installment > 0 && money_out.original_money_out.nil?
      content_tag(:span, "#{money_out.installment}ª de #{money_out.recurrency_quantity}", class: "badge text-bg-info")
    else
      content_tag(:span, "Única", class: "badge text-bg-secondary")
    end
  end
end
