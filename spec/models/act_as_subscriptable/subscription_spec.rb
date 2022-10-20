# == Schema Information
#
# Table name: act_as_subscriptable_subscriptions
#
#  id                   :bigint           not null, primary key
#  subscriptable_type   :string
#  subscriptable_id     :bigint
#  subscriber_type      :string
#  subscriber_id        :bigint
#  title                :string
#  description          :text
#  period_type          :integer          default("years")
#  period_point         :integer          default(1)
#  amount_cents         :integer          default(0), not null
#  amount_currency      :string           default("USD"), not null
#  grace_period_in_days :integer          default(0)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require 'rails_helper'

module ActAsSubscriptable
  RSpec.describe Subscription, type: :model do
    # associations
    it { should have_many(:payments) }

    describe '.is_active' do
      let(:subscription) { create(:subscription) }

      shared_context 'it should be true' do
        it 'it should be True' do
          expect(subscription.is_active).to be true
        end
      end

      shared_context 'it should be false' do
        it 'it should be False' do
          expect(subscription.is_active).to be false
        end
      end

      context 'If there has no payments' do
        include_context 'it should be false'
      end

      context 'When there is a payment' do
        let!(:payment) { create :payment, subscription: subscription }

        include_context 'it should be false'

        context 'If payment is paid' do
          before { payment.update!(state: :paid, ended_at: Time.current + 1.day) }

          include_context 'it should be true'

          context 'if payment expired' do
            before { payment.update!(ended_at: Time.current - 1.day) }

            include_context 'it should be false'
          end
        end
      end
    end
  end
end
