options = {
    filter_html: true,
    link_attributes: {
        rel: "nofollow",
        target: "_blank"
    }
}

extensions = {
    space_after_headers: true,
    autolink: true
}

renderer = Redcarpet::Render::HTML.new(options)
markdown = Redcarpet::Markdown.new(renderer, extensions)

text = <<EOF
# Hello

* 1 - Coffe
* 2 - Rice
* 3 - Chocolate

Ruby on **Rails**
EOF

mmarkdown.render(text).html_safe