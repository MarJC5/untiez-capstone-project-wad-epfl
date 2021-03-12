module ApplicationHelper

  # Dynamic SVG Rendering
  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/icons/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end

  # Markdown convertion
  def markdown(text)
    options = [:autolink, :no_intra_emphasis, :hard_wrap, :fenced_code_blocks]
    Markdown.new(text, *options).to_html.html_safe
  end

end
