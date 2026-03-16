require "rails_helper"

RSpec.describe "MoneyIns", type: :request do
  describe "GET /money_ins" do
    let(:password) { "password123" }
    let(:user) { User.create!(email_address: "user@example.com", password: password, password_confirmation: password) }
    let(:other_user) { User.create!(email_address: "other@example.com", password: password, password_confirmation: password) }
    let!(:category) { Category.create!(name: "Salary", user: user) }
    let!(:other_category) { Category.create!(name: "Freelance", user: other_user) }

    before do
      post session_path, params: { email_address: user.email_address, password: password }
    end

    it "defaults to the current month and only shows the current user's records" do
      MoneyIn.create!(
        label: "Salary March",
        description: "Main income",
        amount: 1200,
        money_date: Date.current.beginning_of_month + 1.day,
        category: category,
        user: user
      )

      MoneyIn.create!(
        label: "Salary Previous Month",
        description: "Old income",
        amount: 900,
        money_date: Date.current.beginning_of_month - 1.day,
        category: category,
        user: user
      )

      MoneyIn.create!(
        label: "Other User Income",
        description: "Should stay hidden",
        amount: 500,
        money_date: Date.current.beginning_of_month + 2.days,
        category: other_category,
        user: other_user
      )

      get money_ins_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Salary March")
      expect(response.body).not_to include("Salary Previous Month")
      expect(response.body).not_to include("Other User Income")
      expect(response.body).to include(%(value="#{Date.current.beginning_of_month}"))
      expect(response.body).to include(%(value="#{Date.current.end_of_month}"))
    end

    it "preserves explicit date filters" do
      MoneyIn.create!(
        label: "January income",
        description: "Older income",
        amount: 700,
        money_date: Date.current.beginning_of_month - 1.month,
        category: category,
        user: user
      )

      MoneyIn.create!(
        label: "Current month income",
        description: "Recent income",
        amount: 800,
        money_date: Date.current.beginning_of_month + 1.day,
        category: category,
        user: user
      )

      get money_ins_path, params: {
        q: {
          money_date_gteq: (Date.current.beginning_of_month - 1.month).to_s,
          money_date_lteq: (Date.current.beginning_of_month - 1.day).to_s
        }
      }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("January income")
      expect(response.body).not_to include("Current month income")
    end
  end
end
