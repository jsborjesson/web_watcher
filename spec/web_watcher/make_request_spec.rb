require "spec_helper"

describe MakeRequest do
  let(:watcher) {
    WatcherRepository.new.create(
      description: "Test description",
      url: "http://www.test.com",
      selector: "#message",
      email: "test@email.com",
    )
  }
  let(:response_body) { '<div><br><br /><span id="message">test target</span></div>' }

  before do
    stub_request(:get, watcher.url).to_return(status: 200, body: response_body)

    RequestRepository.new.clear
  end

  it "makes a web request given a Watcher" do
    MakeRequest.call(watcher)

    assert_requested(:get, watcher.url)
  end

  it "saves the request in the database" do
    request = MakeRequest.call(watcher)

    request.id.wont_be_nil
    request.status_code.must_equal 200
    request.watcher_id.must_equal watcher.id
  end

  it "parses the response according to the given selector" do
    request = MakeRequest.call(watcher)

    request.value.must_equal "test target"
  end
end
