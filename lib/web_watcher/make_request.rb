class MakeRequest
  def self.call(watcher)
    response = HTTP.get(watcher.url)

    selected_contents = Oga.parse_html(response.body.to_s).css(watcher.selector).text

    RequestRepository.new.create(
      value: selected_contents,
      status_code: response.status.code,
      watcher_id: watcher.id,
    )
  end
end
