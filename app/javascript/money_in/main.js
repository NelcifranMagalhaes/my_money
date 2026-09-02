

const initializeMoneyInForm = () => {
  const categorySelect = document.getElementById("moneyInCategoryId");
  const debtorSelectContainer = document.getElementById("debtorSelectContainer");
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

document.addEventListener("turbo:load", initializeMoneyInForm);