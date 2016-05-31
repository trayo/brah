require 'test_helper'

class BrahTest < Minitest::Test

  PUBLIC_URL = "https://github.com/trayo/brah"
  PRIVATE_URL = "https://github.enterprise.com/trayo/brah"

  def test_that_it_has_a_version_number
    refute_nil ::Brah::VERSION
  end

  def test_it_can_open_a_public_github_http_link
    git_remote_http_public = "origin\thttps://github.com/trayo/brah.git (fetch)"

    brah = Brah::Brah.new(git_remote_http_public)
    brah.expects(:system).with("open #{PUBLIC_URL}").returns(true).once

    assert_equal brah.command, "open https://github.com/trayo/brah"
    assert brah.run, "Expected brah.run to be true, but it was false"
  end

  def test_it_can_open_a_public_github_ssh_link
    git_remote_ssh_public = "origin\tgit@github.com:trayo/brah.git (fetch)"

    brah = Brah::Brah.new(git_remote_ssh_public)
    brah.expects(:system).with("open #{PUBLIC_URL}").returns(true).once

    assert_equal brah.command, "open https://github.com/trayo/brah"
    assert brah.run, "Expected brah.run to be true, but it was false"
  end

  def test_it_can_open_a_private_github_http_link
    git_remote_http_private = "origin\thttps://github.enterprise.com/trayo/brah.git (fetch)"

    brah = Brah::Brah.new(git_remote_http_private)
    brah.expects(:system).with("open #{PRIVATE_URL}").returns(true).once

    assert_equal brah.command, "open https://github.enterprise.com/trayo/brah"
    assert brah.run, "Expected brah.run to be true, but it was false"
  end

  def test_it_can_open_a_private_github_ssh_link
    git_remote_ssh_private = "origin\tgit@github.enterprise.com/trayo/brah.git (fetch)"

    brah = Brah::Brah.new(git_remote_ssh_private)
    brah.expects(:system).with("open #{PRIVATE_URL}").returns(true).once

    assert_equal brah.command, "open https://github.enterprise.com/trayo/brah"
    assert brah.run, "Expected brah.run to be true, but it was false"
  end

  def test_when_there_are_remotes_other_than_origin
    git_remote_with_more_than_origin = "heroku\thttps://git.heroku.com/trayo/brah.git (fetch)\nheroku\thttps://git.heroku.com/trayo/brah.git (push)\norigin\thttps://github.com/trayo/brah.git (fetch)\norigin\thttps://github.com/trayo/brah.git (push)"

    brah = Brah::Brah.new(git_remote_with_more_than_origin)
    brah.expects(:system).with("open #{PUBLIC_URL}").returns(true).once

    assert_equal brah.command, "open https://github.com/trayo/brah"
    assert brah.run, "Expected brah.run to be true, but it was false"
  end

  def test_when_there_are_no_remotes_found
    no_remotes = ""

    assert_raises do
      Brah::Brah.new(no_remotes)
    end
  end
end
