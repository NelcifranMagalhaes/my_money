// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "chartkick"
import "Chart.bundle";

document.addEventListener("turbo:load", () => {
  const recurrencyCheckbox = document.getElementById("moneyOutRecurrency");
  const recurrencyQuantityContainer = document.getElementById("recurrencyQuantityContainer");

  if (recurrencyCheckbox) {
    const toggleRecurrencyQuantity = () => {
      if (recurrencyCheckbox.checked) {
        recurrencyQuantityContainer.classList.remove("invisible");
      } else {
        recurrencyQuantityContainer.classList.add("invisible");
      }
    };

    // Initial toggle based on the current state
    toggleRecurrencyQuantity();

    // Add event listener for changes
    recurrencyCheckbox.addEventListener("change", toggleRecurrencyQuantity);
  }
});