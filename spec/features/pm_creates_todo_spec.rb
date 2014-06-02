require 'spec_helper'

feature 'PM creates task' do
  scenario 'Successfully' do
    visit new_task_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect(page).to have_content('Your new Task was saved')
    expect(page).to have_content('Meet up with the team')
  end
  scenario 'With no description' do
    visit new_task_path
    fill_in 'Description', with: ''
    click_button 'Save'
    expect(page).to have_content('Your Task cannot be blank')
  end
end