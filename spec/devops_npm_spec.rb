require "serverspec"
require "docker"

describe "devops-npm Container" do
  before(:all) do
    image = Docker::Image.build_from_dir('.')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  describe "installed Apps" do

    describe command("npm -version") do
      its(:stdout) { should match /3.10.[0-9]+/ }
    end

    describe command("node -v") do
      its(:stdout) { should match /v6.9.4/}
    end

    describe command("python --version") do
      its(:stdout) { should match /2.7.6/}
    end

    describe command("ruby --version") do
      its(:stdout) { should match /2.2.3/}
    end

  end

end
