require 'spec_helper'

describe Spree::Order do

  context '#finalize_with_experience_drop_ship!' do

    after do
      SpreeExperienceDropShip::Config[:send_experience_email] = true
    end

    it 'should deliver experience drop ship orders when Spree::ExperienceDropShipConfig[:send_experience_email] == true' do
      order = create(:order_with_totals, ship_address: create(:address))
      order.line_items = [create(:line_item, variant: create(:variant_with_experience)), create(:line_item, variant: create(:variant_with_experience))]
      order.create_proposed_shipments

      order.shipments.each do |shipment|
        Spree::ExperienceDropShipOrderMailer.should_receive(:experience_order).with(shipment.id).and_return(double(Mail, :deliver! => true))
      end

      order.finalize!
      order.reload

      # Check orders are properly split.
      order.shipments.size.should eql(2)
      order.shipments.each do |shipment|
        shipment.line_items.size.should eql(1)
        shipment.line_items.first.variant.experiences.first.should eql(shipment.experience)
      end
    end

    it 'should NOT deliver experience drop ship orders when Spree::ExperienceDropShipConfig[:send_experience_email] == false' do
      SpreeExperienceDropShip::Config[:send_experience_email] = false
      order = create(:order_with_totals, ship_address: create(:address))
      order.line_items = [create(:line_item, variant: create(:variant_with_experience)), create(:line_item, variant: create(:variant_with_experience))]
      order.create_proposed_shipments

      order.shipments.each do |shipment|
        Spree::ExperienceDropShipOrderMailer.should_not_receive(:experience_order).with(shipment.id)
      end

      order.finalize!
      order.reload

      # Check orders are properly split.
      order.shipments.size.should eql(2)
      order.shipments.each do |shipment|
        shipment.line_items.size.should eql(1)
        shipment.line_items.first.variant.experiences.first.should eql(shipment.experience)
      end
    end

  end

end