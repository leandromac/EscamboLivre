prawn_document(page_layout: :landscape) do |pdf| # formato pode ser landscape or portrait
  pdf.text "Listando Categorias"
  pdf.move_down 20
  pdf.table @categories.collect{|p| [p.id,p.description]}
end