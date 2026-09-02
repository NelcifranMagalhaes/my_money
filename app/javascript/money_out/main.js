
const initializeMoneyOutForm = () => {
  const recurrencyCheckbox = document.getElementById("moneyOutRecurrency");
  const recurrencyQuantityContainer = document.getElementById("recurrencyQuantityContainer");
  const categorySelect = document.getElementById("moneyOutCategoryId");
  const debtorSelectContainer = document.getElementById("debtorSelectContainer");

  if (recurrencyCheckbox && recurrencyQuantityContainer) {
    const toggleRecurrencyQuantity = () => {
      recurrencyQuantityContainer.classList.toggle("invisible", !recurrencyCheckbox.checked);
    };

    toggleRecurrencyQuantity();
    recurrencyCheckbox.addEventListener("change", toggleRecurrencyQuantity);
  }

  if (categorySelect) {
    const toggleDebtorSelect = () => {
      const selectedCategoryText = categorySelect.options[categorySelect.selectedIndex]?.text || "";
      const normalizedText = selectedCategoryText.trim().toLowerCase();

      if (normalizedText === "devedores") {
        debtorSelectContainer.classList.remove("invisible");
      } else {
        debtorSelectContainer.classList.add("invisible");
      }
    };

    toggleDebtorSelect();
    categorySelect.addEventListener("change", toggleDebtorSelect);
  }
};

document.addEventListener("turbo:load", initializeMoneyOutForm);