require_relative '../../app/models/user'

feature 'User' do
  scenario 'Testing that a new user can be created' do
    User.new(username: "Test user",
            password: "Test password",
            password_confirmation: "Test password")
  end
end

feature 'Signing up for a user account' do
  scenario 'after you sign up you are redirected to homepage' do
    sign_up
    expect(current_path).to eq("/")
  end

  scenario 'users will be asked to confirm password' do
    sign_up
    expect { sign_up(password_confirmation: "wrong")}.not_to change(User, :count)
  end

  scenario 'users count should go up by 1 following successful sign-up' do
    expect { sign_up }.to change(User, :count).by(1)
  end


end