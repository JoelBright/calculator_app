# frozen_string_literal: true

# Migration to create the calculators table
class CreateCalculators < ActiveRecord::Migration[7.0]
  def change
    create_table :calculators, &:timestamps
  end
end
